import BowLite

extension EnvIO: Equatable where Dependencies == Int, Failure: Equatable, Success: Equatable {
    public static func ==(lhs: EnvIO<Dependencies, Failure, Success>, rhs: EnvIO<Dependencies, Failure, Success>) -> Bool {
        lhs(0) == rhs(0)
    }
}
