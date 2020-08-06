import XCTest
import SwiftCheck
import BowLiteLaws
import BowLiteCore

class ResultApplicativeErrorTest: XCTestCase {
    func testApplicativeErrorLaws() {
        property("Applicative error handle") <~ forAll { (error: AnyError, f: ArrowOf<AnyError, Int>) in
            
            Result.raiseError(error).handleError(f.getArrow)
                ==
            Result.pure(f.getArrow(error))
        }
        
        property("Applicative error handle with") <~ forAll { (f: ArrowOf<AnyError, Result<Int, AnyError>>, error: AnyError) in
            
            Result.raiseError(error).handleErrorWith(f.getArrow)
                ==
            f.getArrow(error)
        }
        
        property("Applicative error handle with pure") <~ forAll { (a: Int, f: ArrowOf<AnyError, Result<Int, AnyError>>) in
            
            Result.pure(a).handleErrorWith(f.getArrow)
                ==
            Result.pure(a)
        }
    }
}
