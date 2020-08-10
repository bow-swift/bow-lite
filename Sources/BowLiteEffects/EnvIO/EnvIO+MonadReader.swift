public extension EnvIO where Dependencies == Success {
    /// Retrieves the shared environment.
    ///
    /// - Returns: Shared environment.
    static func ask() -> EnvIO<Dependencies, Failure, Dependencies> {
        EnvIO { dependencies in IO.pure(dependencies) }
    }
}

public extension EnvIO {
    /// Executes this computation in a modified environment.
    ///
    /// - Parameters:
    ///   - f: Funtion to modify the environment.
    /// - Returns: Computation in the modified environment.
    func local(_ f: @escaping (Dependencies) -> Dependencies) -> EnvIO<Dependencies, Failure, Success> {
        self.contramap(f)
    }
    
    /// Retrieves a function of the current environment.
    ///
    /// - Parameter f: Selector function to apply to the environment.
    /// - Returns: A value extracted from the environment, in this context.
    static func reader(_ f: @escaping (Dependencies) -> IO<Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO(f)
    }
}
