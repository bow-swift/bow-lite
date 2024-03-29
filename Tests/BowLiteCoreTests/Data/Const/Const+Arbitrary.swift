import SwiftCheck
import BowLiteLaws
import BowLiteCore

extension Const: Arbitrary where Constant: Arbitrary {
    public static var arbitrary: Gen<Const<Constant, Variable>> {
        Constant.arbitrary.map(Const.init)
    }
}
