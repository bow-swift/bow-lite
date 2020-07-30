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
    }
}
