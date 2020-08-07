import XCTest
import SwiftCheck

import BowLiteCore
import BowLiteLaws
import BowLiteEffects

class IOApplicativeErrorTest: XCTestCase {
    func testApplicativeErrorLaws() {
        property("Applicative error handle") <~ forAll { (error: AnyError, f: ArrowOf<AnyError, Int>) in
            
            IO.raiseError(error).handleError(f.getArrow)
                ==
            IO.pure(f.getArrow(error))
        }
        
        property("Applicative error handle with") <~ forAllNoShrink(ioGen, AnyError.arbitrary) { (f: IO<AnyError, Int>, error: AnyError) in
            
            IO.raiseError(error).handleErrorWith(constant(f))
                ==
            constant(f)(error)
        }
        
        property("Applicative error handle with pure") <~ forAllNoShrink(Int.arbitrary, ioGen) { (a: Int, f: IO<AnyError, Int>) in
            
            IO.pure(a).handleErrorWith(constant(f))
                ==
            IO.pure(a)
        }
    }
}
