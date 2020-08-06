import XCTest
import SwiftCheck
import BowLiteLaws
import BowLiteCore

class EvalFunctorTest: XCTestCase {
    func testFunctorLaws() {
        property("Identity is preserved under functor transformation") <~ forAllNoShrink(evalGen) { (fa: Eval<Int>) in
            fa.map(id)
                ==
            id(fa)
        }
        
        property("Composition is preserved under functor transformation") <~ forAllNoShrink(evalGen, ArrowOf<Int, Int>.arbitrary, ArrowOf<Int, Int>.arbitrary) { (fa: Eval<Int>, f: ArrowOf<Int, Int>, g: ArrowOf<Int, Int>) in
            
            fa.map(f.getArrow).map(g.getArrow)
                ==
            fa.map(f.getArrow >>> g.getArrow)
        }

        property("product") <~ forAllNoShrink(evalGen, ArrowOf<Int, Int>.arbitrary) { (fa: Eval<Int>, f: ArrowOf<Int, Int>) in
            
            fa.product(f.getArrow).map { x in x.1 }
                ==
            fa.map(f.getArrow)
        }
        
        property("tuple left") <~ forAllNoShrink(evalGen, Int.arbitrary) { (fa: Eval<Int>, b: Int) in
            
            fa.tupleLeft(b).map { x in x.0 }
                ==
            fa.as(b)
        }
        
        property("tuple right") <~ forAllNoShrink(evalGen, Int.arbitrary) { (fa: Eval<Int>, b: Int) in
            
            fa.tupleRight(b).map { x in x.1 }
                ==
            fa.as(b)
        }
    }
}

