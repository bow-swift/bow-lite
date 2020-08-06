import SwiftCheck
import BowLiteLaws
import BowLiteCore

extension Either: Arbitrary where Left: Arbitrary, Right: Arbitrary {
    public static var arbitrary: Gen<Either<Left, Right>> {
        let left = Left.arbitrary.map(Either.left)
        let right = Right.arbitrary.map(Either.right)
        return Gen.one(of: [left, right])
    }
}
