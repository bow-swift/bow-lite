import XCTest
import SwiftCheck
import BowLite

class EnvIOMonadTest: XCTestCase {
    func testMonadLaws() {
        property("Monad left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> EnvIO<Int, AnyError, Int>.pure
            
            return EnvIO.pure(a).flatMap(g)
                ==
            g(a)
        }
        
        property("Monad right identity") <~ forAll { (a: Int) in
            let fa = EnvIO<Int, AnyError, Int>.pure(a)
            return fa.flatMap(EnvIO.pure)
                ==
            fa
        }
        
        property("Kleisli left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> EnvIO<Int, AnyError, Int>.pure
            
            return ({ (n: Int) in EnvIO<Int, AnyError, Int>.pure(n) } >=> g)(a)
                ==
            g(a)
        }
        
        property("Kleisli right identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> EnvIO<Int, AnyError, Int>.pure
            
            return (g >=> EnvIO.pure)(a)
                ==
            g(a)
        }
        
        property("Monad flatMap coherence") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> EnvIO<Int, AnyError, Int>.pure
            let fa = EnvIO<Int, AnyError, Int>.pure(a)
            
            return fa.flatMap(g)
                ==
            fa.map(f.getArrow)
        }
        
        property("Flatten") <~ forAll { (a: Int) in
            EnvIO<Int, AnyError, EnvIO<Int, AnyError, Int>>.pure(EnvIO.pure(a)).flatten()
                ==
            EnvIO<Int, AnyError, Int>.pure(a)
        }
        
        property("Monad comprehensions equivalence to flatMap") <~ forAllNoShrink(envIOGen, envIOGen, envIOGen) { fa, fb, fc in
            let r1 = fa.flatMap { a in
                fb.flatMap { b in
                    fc.map { c in "\(a), \(b), \(c)" }
                }
            }
            
            let x = EnvIO<Int, AnyError, Int>.var()
            let y = EnvIO<Int, AnyError, Int>.var()
            let z = EnvIO<Int, AnyError, Int>.var()
            
            let r2 = binding(
                x <-- fa,
                y <-- fb,
                z <-- fc,
                yield: "\(x.get), \(y.get), \(z.get)"
            )
            
            return r1 == r2
        }
    }
}
