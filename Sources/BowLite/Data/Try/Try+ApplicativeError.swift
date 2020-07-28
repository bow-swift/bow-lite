public extension Try {
    /// Lifts an error to this context.
    ///
    /// - Parameter error: A value of the error type.
    /// - Returns: A value representing the error in this context.
    static func raiseError(_ error: Error) -> Try<Success> {
        .failure(error)
    }
    
    /// Creates a value of this type from a Result.
    ///
    /// - Parameter result: Result value to convert to this type.
    /// - Returns: A value that represents the same content from Result, in this context.
    static func from(result: Result<Success, Error>) -> Try<Success> {
        result.fold(Try.success, Try.failure)
    }
    
    /// Creates a value of this type from an Either.
    ///
    /// - Parameter either: Result value to convert to this type.
    /// - Returns: A value that represents the same content from Either, in this context.
    static func from(either: Either<Error, Success>) -> Try<Success> {
        either.fold(Try.failure, Try.success)
    }
    
    /// Handles an error, potentially recovering from it by mapping it to a value in this context.
    ///
    /// - Parameters:
    ///   - f: A recovery function.
    /// - Returns: A value where the possible errors have been recovered using the provided function.
    func handleErrorWith(_ f: @escaping (Error) -> Try<Success>) -> Try<Success> {
        self.fold(f, Try.success)
    }
    
    /// Handles an error, potentially recovering from it by mapping it to a value.
    ///
    /// - Parameters:
    ///   - f: A recovery function.
    /// - Returns: A value where the possible errors have been recovered using the provided function.
    func handleError(_ f: @escaping (Error) -> Success) -> Try<Success> {
        handleErrorWith(f >>> Try.success)
    }
}
