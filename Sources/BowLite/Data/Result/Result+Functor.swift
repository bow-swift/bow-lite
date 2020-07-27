public extension Result {
    /// Given a function, provides a new function lifted to the context of this type.
    ///
    /// - Parameter f: Function to be lifted.
    /// - Returns: Function in the context of this type.
    static func lift<B>(_ f: @escaping (Success) -> B) -> (Result<Success, Failure>) -> Result<B, Failure> {
        { result in result.map(f) }
    }
    
    /// Transforms the value type with a constant value.
    ///
    /// - Parameters:
    ///   - b: Constant value to replace the value type.
    /// - Returns: A new value with the structure of the original value, with its value type transformed.
    func `as`<B>(_ b: B) -> Result<B, Failure> {
        self.map(constant(b))
    }
    
    /// Replaces the value type by the `Void` type.
    ///
    /// - Returns: New value in this context, with `Void` as value type, preserving the original structure.
    func void() -> Result<Void, Failure> {
        self.as(())
    }
    
    /// Transforms the value type and pairs it with its original value.
    ///
    /// - Parameters:
    ///   - f: Transforming function.
    /// - Returns: A pair with the original value and its transformation, with the structure of the original value.
    func product<B>(_ f: @escaping (Success) -> B) -> Result<(Success, B), Failure> {
        self.map { a in (a, f(a)) }
    }
    
    /// Transforms the value type by making a tuple with a new constant value to the left of the original value type.
    ///
    /// - Parameters:
    ///   - b: Constant value for the tuple.
    /// - Returns: A new value with the structure of the original value, with a tuple in its value type.
    func tupleLeft<B>(_ b: B) -> Result<(B, Success), Failure> {
        self.map { a in (b, a) }
    }
    
    /// Transforms the value type by making a tuple with a new constant value to the right of the original value type.
    ///
    /// - Parameters:
    ///   - b: Constant value for the tuple.
    /// - Returns: A new value with the structure of the original value, with a tuple in its value type.
    func tupleRight<B>(_ b: B) -> Result<(Success, B), Failure> {
        self.map { a in (a, b) }
    }
}
