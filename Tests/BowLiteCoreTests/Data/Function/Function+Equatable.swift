import BowLiteCore
import BowLiteLaws

extension Function: Equatable where Input == Int, Output: Equatable {
    public static func ==(lhs: Function<Input, Output>, rhs: Function<Input, Output>) -> Bool {
        lhs.invoke(0) == rhs.invoke(0)
    }
}
