import BowLite

extension Function: Equatable where Input == Int, Output: Equatable {
    public static func ==(lhs: Function<Input, Output>, rhs: Function<Input, Output>) -> Bool {
        lhs(0) == rhs(0)
    }
}
