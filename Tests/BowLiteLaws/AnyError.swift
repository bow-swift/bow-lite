import SwiftCheck
import BowLiteCore

public enum AnyError: Error, Hashable {
    case randomFailure
}

extension AnyError: Arbitrary {
    public static var arbitrary: Gen<AnyError> {
        Gen.fromElements(of: [.randomFailure])
    }
}

extension AnyError: CoArbitrary {
    public static func coarbitrary<C>(_ x: AnyError) -> ((Gen<C>) -> Gen<C>) {
        id
    }
}
