public extension IO {
    static func from(either: Either<Failure, Success>) -> IO<Failure, Success> {
        either.fold(IO.raiseError, IO.pure)
    }
    
    func handleError(_ f: @escaping (Failure) -> Success) -> IO<Failure, Success> {
        handleErrorWith(f >>> IO.pure)
    }
    
    /// Applies a monadic function to an effect discarding the output.
    ///
    /// - Parameters:
    ///   - fa: A computation.
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
