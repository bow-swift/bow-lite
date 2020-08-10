/// Type alias over Function.
public typealias Reader<Input, Output> = Function<Input, Output>

/// This data type acts as a wrapper over functions. It receives two type parameters representing the input and output type of the function.
public struct Function<Input, Output> {
    private let f: (Input) -> Output
    
    /// Constructs a value of `Function`.
    ///
    /// - Parameter f: Function to be wrapped in this type.
    public init(_ f: @escaping (Input) -> Output) {
        self.f = f
    }
    
    /// Invokes this function.
    ///
    /// - Parameter input: Input for the function.
    /// - Returns: Result of the invocation.
    public func callAsFunction(_ input: Input) -> Output {
        f(input)
    }
    
    /// Invokes this function.
    ///
    /// - Parameter input: Input for the function.
    /// - Returns: Result of the invocation.
    public func invoke(_ input: Input) -> Output {
        f(input)
    }
    
    /// Concatenates another function.
    ///
    /// - Parameter other: Function to concatenate.
    /// - Returns: Concatenation of the two functions.
    public func andThen<A>(_ other: Function<Output, A>) -> Function<Input, A> {
        Function<Input, A>(self.f >>> other.f)
    }
    
    /// Pre- and post- composes this function with the provided arguments.
    ///
    /// - Parameters:
    ///   - pre: Function to pre-compose with this function.
    ///   - post: Function to post-compose with this function.
    /// - Returns: Result of composing the three functions.
    public func dimap<A, B>(
        _ pre: @escaping (A) -> Input,
        _ post: @escaping (Output) -> B
    ) -> Function<A, B> {
        Function<A, B>(pre >>> self.f >>> post)
    }
    
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
    public func map<B>(_ f: @escaping (Output) -> B) -> Function<Input, B> {
        dimap(id, f)
    }
    
    /// Composes with another function.
    ///
    /// - Parameter f: Function to compose.
    /// - Returns: Composition of the two functions.
    public func contramap<A>(_ f: @escaping (A) -> Input) -> Function<A, Output> {
        dimap(f, id)
    }
}
