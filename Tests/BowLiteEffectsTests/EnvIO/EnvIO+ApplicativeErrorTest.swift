import XCTest
import SwiftCheck

import BowLiteCore
import BowLiteLaws
import BowLiteEffects

class EnvIOApplicativeErrorTest: XCTestCase {
    func testApplicativeErrorLaws() {
        property("Applicative error handle") <~ forAll { (error: AnyError, f: ArrowOf<AnyError, Int>) in
            
            EnvIO.raiseError(error).handleError(f.getArrow)
                ==
            EnvIO.pure(f.getArrow(error))
        }
        
        property("Applicative error handle with") <~ forAllNoShrink(envIOGen, AnyError.arbitrary) { (f: EnvIO<Int, AnyError, Int>, error: AnyError) in
            
            EnvIO.raiseError(error).handleErrorWith(constant(f))
                ==
            constant(f)(error)
        }
        
        property("Applicative error handle with pure") <~ forAllNoShrink(Int.arbitrary, envIOGen) { (a: Int, f: EnvIO<Int, AnyError, Int>) in
            
            EnvIO.pure(a).handleErrorWith(constant(f))
                ==
            EnvIO.pure(a)
        }
    }
}
