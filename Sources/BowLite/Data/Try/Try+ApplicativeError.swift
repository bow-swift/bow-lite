public extension Try {
    static func raiseError(_ error: Error) -> Try<Success> {
        .failure(error)
    }
    
    static func from(result: Result<Success, Error>) -> Try<Success> {
        result.fold(Try.success, Try.failure)
    }
    
    static func from(either: Either<Error, Success>) -> Try<Success> {
        either.fold(Try.failure, Try.success)
    }
    
    func handleErrorWith(_ f: @escaping (Error) -> Try<Success>) -> Try<Success> {
        self.fold(f, Try.success)
    }
    
    func handleError(_ f: @escaping (Error) -> Success) -> Try<Success> {
        handleErrorWith(f >>> Try.success)
    }
}
