import XCTest
import SwiftCheck
import BowLite

class EitherApplicativeErrorTest: XCTestCase {
    func testApplicativeErrorLaws() {
        property("Applicative error handle") <~ forAll { (error: AnyError, f: ArrowOf<AnyError, Int>) in
            
            Either.raiseError(error).handleError(f.getArrow)
                ==
            Either.pure(f.getArrow(error))
        }
        
        property("Applicative error handle with") <~ forAll { (f: ArrowOf<AnyError, Either<AnyError, Int>>, error: AnyError) in
            
            Either.raiseError(error).handleErrorWith(f.getArrow)
                ==
            f.getArrow(error)
        }
        
        property("Applicative error handle with pure") <~ forAll { (a: Int, f: ArrowOf<AnyError, Either<AnyError, Int>>) in
            
            Either.pure(a).handleErrorWith(f.getArrow)
                ==
            Either.pure(a)
        }
    }
}
