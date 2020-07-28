public extension IO {
    /// Creates a value of this type from an Either.
    ///
    /// - Parameter either: Either value to convert to this type.
    /// - Returns: A value that represents the same content from Either, in this context.
    static func from(either: Either<Failure, Success>) -> IO<Failure, Success> {
        either.fold(IO.raiseError, IO.pure)
    }
    
    /// Creates a value of this type from a Result.
    ///
    /// - Parameter result: Result value to convert to this type.
    /// - Returns: A value that represents the same content from Result, in this context.
    static func from(result: Result<Success, Failure>) -> IO<Failure, Success> {
        result.fold(IO.pure, IO.raiseError)
    }
    
    /// Handles an error, potentially recovering from it by mapping it to a value.
    ///
    /// - Parameters:
    ///   - f: A recovery function.
    /// - Returns: A value where the possible errors have been recovered using the provided function.
    func handleError(_ f: @escaping (Failure) -> Success) -> IO<Failure, Success> {
        handleErrorWith(f >>> IO.pure)
    }
    
    /// Applies a monadic function to an effect discarding the output.
    ///
    /// - Parameters:
    ///   - f: A monadic function which result will be discarded.
    /// - Returns: A computation with the effect of the initial computation.
    func flatTapError<B>(
        _ f: @escaping (Failure) -> IO<Failure, B>) -> IO<Failure, Success> {
        self.handleErrorWith { e in
            f(e).handleErrorWith { _ in .raiseError(e) }
                .followedBy(.raiseError(e))
        }
    }
}
