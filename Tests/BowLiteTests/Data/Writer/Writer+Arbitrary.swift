import SwiftCheck
import BowLite

extension Writer: Arbitrary where Accumulator: Arbitrary, Value: Arbitrary {
    public static var arbitrary: Gen<Writer<Accumulator, Value>> {
        Gen.zip(Accumulator.arbitrary, Value.arbitrary).map(Writer.init)
    }
}
