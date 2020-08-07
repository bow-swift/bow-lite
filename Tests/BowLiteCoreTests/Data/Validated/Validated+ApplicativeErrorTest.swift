import XCTest
import SwiftCheck
import BowLiteLaws
import BowLiteCore

class ValidatedApplicativeErrorTest: XCTestCase {
    func testApplicativeErrorLaws() {
        property("Applicative error handle") <~ forAll { (error: Int, f: ArrowOf<Int, Int>) in
            
            Validated.raiseError(error).handleError(f.getArrow)
                ==
            Validated.pure(f.getArrow(error))
        }
        
        property("Applicative error handle with") <~ forAll { (f: ArrowOf<Int, Validated<Int, Int>>, error: Int) in
            
            Validated.raiseError(error).handleErrorWith(f.getArrow)
                ==
            f.getArrow(error)
        }
        
        property("Applicative error handle with pure") <~ forAll { (a: Int, f: ArrowOf<Int, Validated<Int, Int>>) in
            
            Validated.pure(a).handleErrorWith(f.getArrow)
                ==
            Validated.pure(a)
        }
    }
}
