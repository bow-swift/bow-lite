import SwiftCheck
import BowLite

extension Validated: Arbitrary where Invalid: Arbitrary, Valid: Arbitrary {
    public static var arbitrary: Gen<Validated<Invalid, Valid>> {
        let invalid = Invalid.arbitrary.map(Validated.invalid)
        let valid = Valid.arbitrary.map(Validated.valid)
        return Gen.one(of: [invalid, valid])
    }
}
