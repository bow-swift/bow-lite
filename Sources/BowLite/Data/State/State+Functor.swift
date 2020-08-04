public extension State {
    /// Creates a new value transforming this type using the provided function, preserving the structure of the original type.
    ///
    /// The implementation of this function must obey two laws:
    ///
    /// 1. Preserve identity:
    ///
    ///         map(fa, id) == fa
    ///
    /// 2. Preserve composition:
    ///
    ///         map(map(fa, f), g) == map(fa, compose(g, f))
    ///
    /// - Parameters:
    ///   - f: A transforming function.
    /// - Returns: The result of transforming the value type using the provided function, maintaining the structure of the original value.
    func map<B>(_ f: @escaping (Value) -> B) -> State<StateType, B> {
        State<StateType, B> { state in
            let (newState, value) = self.invoke(state)
            return (newState, f(value))
        }
    }
    
    /// Given a function, provides a new function lifted to the context of this type.
    ///
    /// - Parameter f: Function to be lifted.
    /// - Returns: Function in the context of this type.
    static func lift<B>(_ f: @escaping (Value) -> B) -> (State<StateType, Value>) -> State<StateType, B> {
        { state in state.map(f) }
    }
    
    /// Transforms the value type with a constant value.
    ///
    /// - Parameters:
    ///   - b: Constant value to replace the value type.
    /// - Returns: A new value with the structure of the original value, with its value type transformed.
    func `as`<B>(_ b: B) -> State<StateType, B> {
        self.map(constant(b))
    }
    
    /// Replaces the value type by the `Void` type.
    ///
    /// - Returns: New value in this context, with `Void` as value type, preserving the original structure.
    func void() -> State<StateType, Void> {
        self.as(())
    }
    
    /// Transforms the value type and pairs it with its original value.
    ///
    /// - Parameters:
    ///   - f: Transforming function.
    /// - Returns: A pair with the original value and its transformation, with the structure of the original value.
    func product<B>(_ f: @escaping (Value) -> B) -> State<StateType, (Value, B)> {
        self.map { a in (a, f(a)) }
    }
    
    /// Transforms the value type by making a tuple with a new constant value to the left of the original value type.
    ///
    /// - Parameters:
    ///   - b: Constant value for the tuple.
    /// - Returns: A new value with the structure of the original value, with a tuple in its value type.
    func tupleLeft<B>(_ b: B) -> State<StateType, (B, Value)> {
        self.map { a in (b, a) }
    }
    
    /// Transforms the value type by making a tuple with a new constant value to the right of the original value type.
    ///
    /// - Parameters:
    ///   - b: Constant value for the tuple.
    /// - Returns: A new value with the structure of the original value, with a tuple in its value type.
    func tupleRight<B>(_ b: B) -> State<StateType, (Value, B)> {
        self.map { a in (a, b) }
    }
}
