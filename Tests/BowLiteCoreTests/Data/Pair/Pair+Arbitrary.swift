import SwiftCheck
import BowLiteLaws
import BowLiteCore

extension Pair: Arbitrary where First: Arbitrary, Second: Arbitrary {
    public static var arbitrary: Gen<Pair<First, Second>> {
        Gen.zip(First.arbitrary, Second.arbitrary).map { first, second in
            Pair(first, second)
        }
    }
}
