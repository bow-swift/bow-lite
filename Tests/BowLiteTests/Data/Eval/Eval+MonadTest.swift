import XCTest
import SwiftCheck
import BowLite

class EvalMonadTest: XCTestCase {
    func testMonadLaws() {
        property("Monad left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Eval<Int>.pure
            
            return Eval.pure(a).flatMap(g)
                ==
            g(a)
        }
        
        property("Monad right identity") <~ forAll { (a: Int) in
            let fa = Eval<Int>.pure(a)
            return fa.flatMap(Eval.pure)
                ==
            fa
        }
        
        property("Kleisli left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Eval<Int>.pure
            
            return ({ (n: Int) in Eval<Int>.pure(n) } >=> g)(a)
                ==
            g(a)
        }
        
        property("Kleisli right identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Eval<Int>.pure
            
            return (g >=> Eval.pure)(a)
                ==
            g(a)
        }
        
        property("Monad flatMap coherence") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Eval<Int>.pure
            let fa = Eval<Int>.pure(a)
            
            return fa.flatMap(g)
                ==
            fa.map(f.getArrow)
        }
        
        property("Flatten") <~ forAll { (a: Int) in
            Eval<Eval<Int>>.pure(Eval.pure(a)).flatten()
                ==
            Eval<Int>.pure(a)
        }
    }
}
