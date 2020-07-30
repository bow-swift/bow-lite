import XCTest
import SwiftCheck
import BowLite

class IOMonadTest: XCTestCase {
    func testMonadLaws() {
        property("Monad left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> IO<AnyError, Int>.pure
            
            return IO.pure(a).flatMap(g)
                ==
            g(a)
        }
        
        property("Monad right identity") <~ forAll { (a: Int) in
            let fa = IO<AnyError, Int>.pure(a)
            return fa.flatMap(IO.pure)
                ==
            fa
        }
        
        property("Kleisli left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> IO<AnyError, Int>.pure
            
            return ({ (n: Int) in IO<AnyError, Int>.pure(n) } >=> g)(a)
                ==
            g(a)
        }
        
        property("Kleisli right identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> IO<AnyError, Int>.pure
            
            return (g >=> IO.pure)(a)
                ==
            g(a)
        }
        
        property("Monad flatMap coherence") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> IO<AnyError, Int>.pure
            let fa = IO<AnyError, Int>.pure(a)
            
            return fa.flatMap(g)
                ==
            fa.map(f.getArrow)
        }
        
        property("Flatten") <~ forAll { (a: Int) in
            IO<AnyError, IO<AnyError, Int>>.pure(IO.pure(a)).flatten()
                ==
            IO<AnyError, Int>.pure(a)
        }
    
        property("Monad comprehensions equivalence to flatMap") <~ forAllNoShrink(ioGen, ioGen, ioGen) { fa, fb, fc in
            let r1 = fa.flatMap { a in
                fb.flatMap { b in
                    fc.map { c in "\(a), \(b), \(c)" }
                }
            }
            
            let x = IO<AnyError, Int>.var()
            let y = IO<AnyError, Int>.var()
            let z = IO<AnyError, Int>.var()
            
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
