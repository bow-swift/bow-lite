import SwiftCheck
import BowLiteLaws
import BowLiteCore

extension Ior: Arbitrary where Left: Arbitrary, Right: Arbitrary {
    public static var arbitrary: Gen<Ior<Left, Right>> {
        let left = Left.arbitrary.map(Ior.left)
        let right = Right.arbitrary.map(Ior.right)
        let both = Gen.zip(Left.arbitrary, Right.arbitrary).map(Ior.both)
        return Gen.one(of: [left, right, both])
    }
}
