public extension EnvIO {
    /// Flattens this nested structure into a single layer.
    ///
    /// - Returns: Value with a single context structure.
    func flatten<A>() -> EnvIO<Dependencies, Failure, A> where Success == EnvIO<Dependencies, Failure, A> {
        self.flatMap(id)
    }
    
    /// Sequentially compose two computations, discarding the value produced by the first.
    ///
    /// - Parameters:
    ///   - fa: 2nd computation.
    /// - Returns: Result of running the second computation after the first one.
    func followedBy<A>(_ fa: EnvIO<Dependencies, Failure, A>) -> EnvIO<Dependencies, Failure, A> {
        self.flatMap(constant(fa))
    }
    
    /// Sequentially compose two computations, discarding the value produced by the second.
    ///
    /// - Parameters:
    ///   - fa: 2nd computation.
    /// - Returns: Result produced from the first computation after both are computed.
    func forEffect<A>(_ fa: EnvIO<Dependencies, Failure, A>) -> EnvIO<Dependencies, Failure, Success> {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    /// Pair the result of a computation with the result of applying a function to such result.
    ///
    /// - Parameters:
    ///   - f: A function to be applied to the result of the computation.
    /// - Returns: A tuple of the result of the computation paired with the result of the function, in this context.
    func mproduct<A>(_ f: @escaping (Success) -> EnvIO<Dependencies, Failure, A>) -> EnvIO<Dependencies, Failure, (Success, A)> {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    /// Conditionally apply a closure based on the boolean result of this computation.
    ///
    /// - Parameters:
    ///   - then: Closure to be applied if the computation evaluates to `true`.
    ///   - else: Closure to be applied if the computation evaluates to `false`.
    /// - Returns: Result of applying the corresponding closure based on the result of the computation.
    func `if`<A>(
        then f: @escaping () -> EnvIO<Dependencies, Failure, A>,
        else g: @escaping () -> EnvIO<Dependencies, Failure, A>
    ) -> EnvIO<Dependencies, Failure, A> where Success == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    /// Applies a monadic function and discard the result while keeping the effect.
    ///
    /// - Parameters:
    ///   - f: A monadic function which result will be discarded.
    /// - Returns: A computation with the result of the initial computation and the effect caused by the function application.
    func flatTap<A>(_ f: @escaping (Success) -> EnvIO<Dependencies, Failure, A>) -> EnvIO<Dependencies, Failure, Success> {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
