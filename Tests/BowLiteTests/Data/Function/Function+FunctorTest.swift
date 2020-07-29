import XCTest
import SwiftCheck
import BowLite

class FunctionFunctorTest: XCTestCase {
    func testFunctorLaws() {
        property("Identity is preserved under functor transformation") <~ forAll() { (fa: Function<Int, Int>) in
            fa.map(id)(0)
                ==
            id(fa)(0)
        }
        
        property("Composition is preserved under functor transformation") <~ forAll() { (fa: Function<Int, Int>, f: ArrowOf<Int, Int>, g: ArrowOf<Int, Int>) in
            
            fa.map(f.getArrow).map(g.getArrow)(0)
                ==
            fa.map(f.getArrow >>> g.getArrow)(0)
        }

        property("product") <~ forAll { (fa: Function<Int, Int>, f: ArrowOf<Int, Int>) in
            
            fa.product(f.getArrow).map { x in x.1 }(0)
                ==
            fa.map(f.getArrow)(0)
        }
        
        property("tuple left") <~ forAll { (fa: Function<Int, Int>, b: Int) in
            
            fa.tupleLeft(b).map { x in x.0 }(0)
                ==
            fa.as(b)(0)
        }
        
        property("tuple right") <~ forAll { (fa: Function<Int, Int>, b: Int) in
            
            fa.tupleRight(b).map { x in x.1 }(0)
                ==
            fa.as(b)(0)
        }
    }
}

