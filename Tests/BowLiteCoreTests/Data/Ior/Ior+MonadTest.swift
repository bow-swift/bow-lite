import XCTest
import SwiftCheck
import BowLiteLaws
import BowLiteCore

class IorMonadTest: XCTestCase {
    func testMonadLaws() {
        property("Monad left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Ior<Int, Int>.pure
            
            return Ior.pure(a).flatMap(g)
                ==
            g(a)
        }
        
        property("Monad right identity") <~ forAll { (a: Int) in
            let fa = Ior<Int, Int>.pure(a)
            return fa.flatMap(Ior.pure)
                ==
            fa
        }
        
        property("Kleisli left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Ior<Int, Int>.pure
            
            return ({ (n: Int) in Ior<Int, Int>.pure(n) } >=> g)(a)
                ==
            g(a)
        }
        
        property("Kleisli right identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Ior<Int, Int>.pure
            
            return (g >=> Ior.pure)(a)
                ==
            g(a)
        }
        
        property("Monad flatMap coherence") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Ior<Int, Int>.pure
            let fa = Ior<Int, Int>.pure(a)
            
            return fa.flatMap(g)
                ==
            fa.map(f.getArrow)
        }
        
        property("Flatten") <~ forAll { (a: Int) in
            Ior<Int, Ior<Int, Int>>.pure(Ior.pure(a)).flatten()
                ==
            Ior<Int, Int>.pure(a)
        }
    }
}
