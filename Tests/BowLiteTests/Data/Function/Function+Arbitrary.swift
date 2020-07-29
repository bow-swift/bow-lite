import SwiftCheck
import BowLite

extension Function: Arbitrary where Input: Hashable & CoArbitrary, Output: Arbitrary {
    public static var arbitrary: Gen<Function<Input, Output>> {
        ArrowOf<Input, Output>.arbitrary.map { arrow in
            Function(arrow.getArrow)
        }
    }
}
