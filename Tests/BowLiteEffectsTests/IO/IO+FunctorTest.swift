import XCTest
import SwiftCheck

import BowLiteCore
import BowLiteLaws
import BowLiteEffects

class IOFunctorTest: XCTestCase {
    func testFunctorLaws() {
        property("Identity is preserved under functor transformation") <~ forAllNoShrink(ioGen) { (fa: IO<AnyError, Int>) in
            fa.map(id)
                ==
            id(fa)
        }
        
        property("Composition is preserved under functor transformation") <~ forAllNoShrink(ioGen, ArrowOf<Int, Int>.arbitrary, ArrowOf<Int, Int>.arbitrary) { (fa: IO<AnyError, Int>, f: ArrowOf<Int, Int>, g: ArrowOf<Int, Int>) in
            
            fa.map(f.getArrow).map(g.getArrow)
                ==
            fa.map(f.getArrow >>> g.getArrow)
        }

        property("product") <~ forAllNoShrink(ioGen, ArrowOf<Int, Int>.arbitrary) { (fa: IO<AnyError, Int>, f: ArrowOf<Int, Int>) in
            
            fa.product(f.getArrow).map { x in x.1 }
                ==
            fa.map(f.getArrow)
        }
        
        property("tuple left") <~ forAllNoShrink(ioGen, Int.arbitrary) { (fa: IO<AnyError, Int>, b: Int) in
            
            fa.tupleLeft(b).map { x in x.0 }
                ==
            fa.as(b)
        }
        
        property("tuple right") <~ forAllNoShrink(ioGen, Int.arbitrary) { (fa: IO<AnyError, Int>, b: Int) in
            
            fa.tupleRight(b).map { x in x.1 }
                ==
            fa.as(b)
        }
    }
}

