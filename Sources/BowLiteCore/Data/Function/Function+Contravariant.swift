public extension Function {
    /// Given a function, provides a new function lifted to this context type, but reversing the direction of the arrow.
    ///
    /// - Parameter f: Function to be lifted.
    /// - Returns: Function in the context implementing this instance.
    static func contralift<A>(_ f: @escaping (A) -> Input) -> (Function<Input, Output>) -> Function<A, Output> {
        { function in function.contramap(f) }
    }
}
