import SwiftCheck
import BowLiteLaws
import BowLiteCore

extension Id: Arbitrary where Wrapped: Arbitrary {
    public static var arbitrary: Gen<Id<Wrapped>> {
        Wrapped.arbitrary.map(Id.init)
    }
}
