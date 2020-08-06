import XCTest
import SwiftCheck
import BowLiteLaws
import BowLiteCore

class NEAMonadTest: XCTestCase {
    func testMonadLaws() {
        property("Monad left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> NEA<Int>.pure
            
            return NEA.pure(a).flatMap(g)
                ==
            g(a)
        }
        
        property("Monad right identity") <~ forAll { (a: Int) in
            let fa = NEA<Int>.pure(a)
            return fa.flatMap(NEA.pure)
                ==
            fa
        }
        
        property("Kleisli left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> NEA<Int>.pure
            
            return ({ (n: Int) in NEA<Int>.pure(n) } >=> g)(a)
                ==
            g(a)
        }
        
        property("Kleisli right identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> NEA<Int>.pure
            
            return (g >=> NEA.pure)(a)
                ==
            g(a)
        }
        
        property("Monad flatMap coherence") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> NEA<Int>.pure
            let fa = NEA<Int>.pure(a)
            
            return fa.flatMap(g)
                ==
            fa.map(f.getArrow)
        }
        
        property("Flatten") <~ forAll { (a: Int) in
            NEA<NEA<Int>>.pure(NEA.pure(a)).flatten()
                ==
            NEA<Int>.pure(a)
        }
    }
}
