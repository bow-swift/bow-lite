import XCTest
import SwiftCheck
import BowLite

class TryFunctorTest: XCTestCase {
    func testFunctorLaws() {
        property("Identity is preserved under functor transformation") <~ forAll() { (fa: Try<Int>) in
            fa.map(id)
                ==
            id(fa)
        }
        
        property("Composition is preserved under functor transformation") <~ forAll() { (fa: Try<Int>, f: ArrowOf<Int, Int>, g: ArrowOf<Int, Int>) in
            
            fa.map(f.getArrow).map(g.getArrow)
                ==
            fa.map(f.getArrow >>> g.getArrow)
        }

        property("product") <~ forAll { (fa: Try<Int>, f: ArrowOf<Int, Int>) in
            
            fa.product(f.getArrow).map { x in x.1 }
                ==
            fa.map(f.getArrow)
        }
        
        property("tuple left") <~ forAll { (fa: Try<Int>, b: Int) in
            
            fa.tupleLeft(b).map { x in x.0 }
                ==
            fa.as(b)
        }
        
        property("tuple right") <~ forAll { (fa: Try<Int>, b: Int) in
            
            fa.tupleRight(b).map { x in x.1 }
                ==
            fa.as(b)
        }
    }
}

