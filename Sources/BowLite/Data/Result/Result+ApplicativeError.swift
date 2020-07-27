public extension Result {
    /// Lifts an error to this context.
    ///
    /// - Parameter e: A value of the error type.
    /// - Returns: A value representing the error in this context.
    static func raiseError(_ error: Failure) -> Result<Success, Failure> {
        .failure(error)
    }
    
    /// Creates a value of this type from an Either.
    ///
    /// - Parameter either: Either value to convert to this type.
    /// - Returns: A value that represents the same content from Either, in this context.
    static func from(either: Either<Failure, Success>) -> Result<Success, Failure> {
        either.fold(Result.failure, Result.success)
    }
    
    /// Handles an error, potentially recovering from it by mapping it to a value in this context.
    ///
    /// - Parameters:
    ///   - f: A recovery function.
    /// - Returns: A value where the possible errors have been recovered using the provided function.
    func handleErrorWith(_ f: @escaping (Failure) -> Result<Success, Failure>) -> Result<Success, Failure> {
        self.fold(Result.success, f)
    }
    
    /// Handles an error, potentially recovering from it by mapping it to a value.
    ///
    /// - Parameters:
    ///   - f: A recovery function.
    /// - Returns: A value where the possible errors have been recovered using the provided function.
    func handleError(_ f: @escaping (Failure) -> Success) -> Result<Success, Failure> {
        handleErrorWith(f >>> Result.success)
    }
}
