import SwiftCheck
import BowLite

extension Const: Arbitrary where Constant: Arbitrary {
    public static var arbitrary: Gen<Const<Constant, Variable>> {
        Constant.arbitrary.map(Const.init)
    }
}
