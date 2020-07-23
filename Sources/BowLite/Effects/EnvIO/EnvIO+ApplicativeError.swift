public extension EnvIO {
    static func from(either: Either<Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        either.fold(EnvIO.raiseError, EnvIO.pure)
    }
    
    func handleError(_ f: @escaping (Failure) -> Success) -> EnvIO<Dependencies, Failure, Success> {
        handleErrorWith(f >>> EnvIO.pure)
    }
    
    /// Applies a monadic function to an effect discarding the output.
    ///
    /// - Parameters:
    ///   - fa: A computation.
    ///   - f: A monadic function which result will be discarded.
    /// - Returns: A computation with the effect of the initial computation.
    func flatTapError<B>(
        _ f: @escaping (Failure) -> EnvIO<Dependencies, Failure, B>) -> EnvIO<Dependencies, Failure, Success> {
        self.handleErrorWith { e in
            f(e).handleErrorWith { _ in .raiseError(e) }
                .followedBy(.raiseError(e))
        }
    }
}
