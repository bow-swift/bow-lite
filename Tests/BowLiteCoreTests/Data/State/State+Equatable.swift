import BowLiteCore
import BowLiteLaws

extension State: Equatable where StateType == Int, Value: Equatable {
    public static func ==(lhs: State<StateType, Value>, rhs: State<StateType, Value>) -> Bool {
        lhs.invoke(0) == rhs.invoke(0)
    }
}
