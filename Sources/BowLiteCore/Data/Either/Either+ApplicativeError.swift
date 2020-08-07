public extension Either {
    /// Lifts an error to this context.
    ///
    /// - Parameter error: A value of the error type.
    /// - Returns: A value representing the error in this context.
    static func raiseError(_ error: Left) -> Either<Left, Right> {
        .left(error)
    }
    
    /// Handles an error, potentially recovering from it by mapping it to a value in this context.
    ///
    /// - Parameters:
    ///   - f: A recovery function.
    /// - Returns: A value where the possible errors have been recovered using the provided function.
    func handleErrorWith(_ f: @escaping (Left) -> Either<Left, Right>) -> Either<Left, Right> {
        self.fold(f, Either.right)
    }

    /// Handles an error, potentially recovering from it by mapping it to a value.
    ///
    /// - Parameters:
    ///   - f: A recovery function.
    /// - Returns: A value where the possible errors have been recovered using the provided function.
    func handleError(_ f: @escaping (Left) -> Right) -> Either<Left, Right> {
        handleErrorWith(f >>> Either.right)
    }
}

public extension Either where Left: Error {
    /// Creates a value of this type from a Result.
    ///
    /// - Parameter result: Result value to convert to this type.
    /// - Returns: A value that represents the same content from Result, in this context.
    static func from(result: Result<Right, Left>) -> Either<Left, Right> {
        result.fold(Either.right, Either.left)
    }
}
