import XCTest
import SwiftCheck
import BowLite

class EnvIOFunctorTest: XCTestCase {
    func testFunctorLaws() {
        property("Identity is preserved under functor transformation") <~ forAllNoShrink(envIOGen) { (fa: EnvIO<Int, AnyError, Int>) in
            fa.map(id)
                ==
            id(fa)
        }
        
        property("Composition is preserved under functor transformation") <~ forAllNoShrink(envIOGen, ArrowOf<Int, Int>.arbitrary, ArrowOf<Int, Int>.arbitrary) { (fa: EnvIO<Int, AnyError, Int>, f: ArrowOf<Int, Int>, g: ArrowOf<Int, Int>) in
            
            fa.map(f.getArrow).map(g.getArrow)
                ==
            fa.map(f.getArrow >>> g.getArrow)
        }

        property("product") <~ forAllNoShrink(envIOGen, ArrowOf<Int, Int>.arbitrary) { (fa: EnvIO<Int, AnyError, Int>, f: ArrowOf<Int, Int>) in
            
            fa.product(f.getArrow).map { x in x.1 }
                ==
            fa.map(f.getArrow)
        }
        
        property("tuple left") <~ forAllNoShrink(envIOGen, Int.arbitrary) { (fa: EnvIO<Int, AnyError, Int>, b: Int) in
            
            fa.tupleLeft(b).map { x in x.0 }
                ==
            fa.as(b)
        }
        
        property("tuple right") <~ forAllNoShrink(envIOGen, Int.arbitrary) { (fa: EnvIO<Int, AnyError, Int>, b: Int) in
            
            fa.tupleRight(b).map { x in x.1 }
                ==
            fa.as(b)
        }
    }
}

