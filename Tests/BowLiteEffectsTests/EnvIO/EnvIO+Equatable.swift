import BowLiteEffects

extension EnvIO: Equatable where Dependencies == Int, Failure: Equatable, Success: Equatable {
    public static func ==(lhs: EnvIO<Dependencies, Failure, Success>, rhs: EnvIO<Dependencies, Failure, Success>) -> Bool {
        lhs.provide(0) == rhs.provide(0)
    }
}
