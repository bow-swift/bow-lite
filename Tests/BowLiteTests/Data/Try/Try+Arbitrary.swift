import SwiftCheck
import BowLite

enum AnyError: Error, Hashable {
    case randomFailure
}

extension AnyError: Arbitrary {
    static var arbitrary: Gen<AnyError> {
        Gen.fromElements(of: [.randomFailure])
    }
}

extension AnyError: CoArbitrary {
    static func coarbitrary<C>(_ x: AnyError) -> ((Gen<C>) -> Gen<C>) {
        id
    }
}

extension Try: Arbitrary where Success: Arbitrary {
    public static var arbitrary: Gen<Try<Success>> {
        let success = Success.arbitrary.map(Try.success)
        let failure = AnyError.arbitrary.map(Try.failure)
        return Gen.one(of: [success, failure])
    }
}
