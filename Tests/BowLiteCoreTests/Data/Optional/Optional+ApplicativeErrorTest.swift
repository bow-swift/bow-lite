import XCTest
import SwiftCheck
import BowLiteLaws
import BowLiteCore

class OptionalApplicativeErrorTest: XCTestCase {
    func testApplicativeErrorLaws() {
        property("Applicative error handle") <~ forAll { (error: AnyError, f: Int) in
            
            Optional.raiseError().handleError(constant(f))
                ==
            Optional.pure(constant(f)(error))
        }
        
        property("Applicative error handle with") <~ forAll { (f: Optional<Int>, error: AnyError) in
            
            Optional.raiseError().handleErrorWith(constant(f))
                ==
            constant(f)(error)
        }
        
        property("Applicative error handle with pure") <~ forAll { (a: Int, f: Optional<Int>) in
            
            Optional.pure(a).handleErrorWith(constant(f))
                ==
            Optional.pure(a)
        }
    }
}
