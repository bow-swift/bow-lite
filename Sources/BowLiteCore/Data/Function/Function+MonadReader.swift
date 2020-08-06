public extension Function where Input == Output {
    /// Retrieves the shared environment.
    ///
    /// - Returns: Shared environment.
    static func ask() -> Function<Input, Input> {
        Function(id)
    }
}

public extension Function {
    /// Executes this computation in a modified environment.
    ///
    /// - Parameters:
    ///   - f: Funtion to modify the environment.
    /// - Returns: Computation in the modified environment.
    func local(_ f: @escaping (Input) -> Input) -> Function<Input, Output> {
        self.contramap(f)
    }
    
    /// Retrieves a function of the current environment.
    ///
    /// - Parameter f: Selector function to apply to the environment.
    /// - Returns: A value extracted from the environment, in this context.
    static func reader(_ f: @escaping (Input) -> Output) -> Function<Input, Output> {
        Function(f)
    }
}
