import SwiftCheck
import BowLite

extension Id: Arbitrary where Wrapped: Arbitrary {
    public static var arbitrary: Gen<Id<Wrapped>> {
        Wrapped.arbitrary.map(Id.init)
    }
}
