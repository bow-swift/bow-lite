import BowLite

extension State: Equatable where StateType == Int, Value: Equatable {
    public static func ==(lhs: State<StateType, Value>, rhs: State<StateType, Value>) -> Bool {
        lhs(0) == rhs(0)
    }
}
