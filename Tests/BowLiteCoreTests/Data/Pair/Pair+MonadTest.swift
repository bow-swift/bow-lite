import XCTest
import SwiftCheck
import BowLiteCore
import BowLiteLaws

class PairMonadTest: XCTestCase {
    func testMonadLaws() {
        property("Monad left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Pair<Int, Int>.pure
            
            return Pair.pure(a).flatMap(g)
                ==
            g(a)
        }
        
        property("Monad right identity") <~ forAll { (a: Int) in
            let fa = Pair<Int, Int>.pure(a)
            return fa.flatMap(Pair.pure)
                ==
            fa
        }
        
        property("Kleisli left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Pair<Int, Int>.pure

            return ({ (n: Int) in Pair.pure(n) } >=> g)(a)
                ==
            g(a)
        }
        
        property("Kleisli right identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Pair<Int, Int>.pure
            
            return (g >=> Pair.pure)(a)
                ==
            g(a)
        }
        
        property("Monad flatMap coherence") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Pair<Int, Int>.pure
            let fa = Pair<Int, Int>.pure(a)
            
            return fa.flatMap(g)
                ==
            fa.map(f.getArrow)
        }
        
        property("Flatten") <~ forAll { (a: Int) in
            Pair<Int, Pair<Int, Int>>.pure(Pair.pure(a)).flatten()
                ==
            Pair<Int, Int>.pure(a)
        }
    }
}
