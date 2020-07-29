/// Pair describes a tuple of two elements. It is a nominal type over Swift tuples, which do not allow extensions to be made on them.
public struct Pair<First, Second> {
    /// First component of the tuple.
    public let first: First
    /// Second component of the tuple.
    public let second: Second
    
    /// Initializes a pair.
    ///
    /// - Parameters:
    ///   - first: First component of the tuple.
    ///   - second: Second component of the tuple.
    public init(_ first: First, _ second: Second) {
        self.first = first
        self.second = second
    }
    
    /// Initializes a pair.
    ///
    /// - Parameter tuple: Tuple of two values.
    public init(_ tuple: (First, Second)) {
        self.first = tuple.0
        self.second = tuple.1
    }
    
    /// Transforms both type parameters, preserving the structure of this value.
    ///
    /// - Parameters:
    ///   - f: Closure to be applied on the first component.
    ///   - g: Closure to be applied on the second component.
    /// - Returns: Result of applying the corresponding closure to this value.
    public func bimap<A, B>(
        _ f: @escaping (First) -> A,
        _ g: @escaping (Second) -> B
    ) -> Pair<A, B> {
        Pair<A, B>(f(self.first), g(self.second))
    }
    
    /// Transforms the first type parameter, preserving the structure of this value.
    ///
    /// - Parameter f: Transforming closure.
    /// - Returns: Result of appliying the transformation to the first component in this value.
    public func mapFirst<L>(
        _ f: @escaping (First) -> L
    ) -> Pair<L, Second> {
        bimap(f, id)
    }
}

// MARK: Conformance to Equatable for Pair

extension Pair: Equatable where First: Equatable, Second: Equatable {}

// MARK: Conformance to CustomStringConvertible for Pair

extension Pair: CustomStringConvertible where First: CustomStringConvertible, Second: CustomStringConvertible {
    public var description: String {
        "(\(self.first.description), \(self.second.description))"
    }
}
