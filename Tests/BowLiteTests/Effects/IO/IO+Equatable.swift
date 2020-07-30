import BowLite

extension IO: Equatable where Failure: Equatable, Success: Equatable {
    public static func ==(lhs: IO<Failure, Success>, rhs: IO<Failure, Success>) -> Bool {
        lhs.unsafeRunSyncEither() == rhs.unsafeRunSyncEither()
    }
}
