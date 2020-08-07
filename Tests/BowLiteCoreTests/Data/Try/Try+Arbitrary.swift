import SwiftCheck

import BowLiteCore
import BowLiteLaws

extension Try: Arbitrary where Success: Arbitrary {
    public static var arbitrary: Gen<Try<Success>> {
        let success = Success.arbitrary.map(Try.success)
        let failure = AnyError.arbitrary.map(Try.failure)
        return Gen.one(of: [success, failure])
    }
}
