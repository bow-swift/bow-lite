import XCTest
import SwiftCheck
import BowLite

class TryApplicativeErrorTest: XCTestCase {
    func testApplicativeErrorLaws() {
        property("Applicative error handle") <~ forAll { (error: AnyError, f: ArrowOf<AnyError, Int>) in
            
            Try.raiseError(error).handleError { e in f.getArrow(e as! AnyError) }
                ==
            Try.pure(f.getArrow(error))
        }
        
        property("Applicative error handle with") <~ forAll { (f: ArrowOf<AnyError, Try<Int>>, error: AnyError) in
            
            Try.raiseError(error).handleErrorWith { e in f.getArrow(e as! AnyError) }
                ==
            f.getArrow(error)
        }
        
        property("Applicative error handle with pure") <~ forAll { (a: Int, f: ArrowOf<AnyError, Try<Int>>) in
            
            Try.pure(a).handleErrorWith { e in f.getArrow(e as! AnyError) }
                ==
            Try.pure(a)
        }
    }
}
