/// A semigroup is an algebraic structure that consists of a set of values and an associative operation.
public protocol Semigroup {
    /// An associative operation to combine values of the implementing type.
    ///
    /// This operation must satisfy the semigroup laws:
    ///
    ///     a.combine(b).combine(c) == a.combine(b.combine(c))
    ///
    /// - Parameter other: Value to combine with the receiver.
    /// - Returns: Combination of the receiver value with the parameter value.
    func combine(_ other: Self) -> Self
}

public extension Semigroup {
    /// Combines two values of the implementing type.
    ///
    /// - Parameters:
    ///   - a: Value of the implementing type.
    ///   - b: Value of the implementing type.
    /// - Returns: Combination of `a` and `b`.
    static func combine(_ a: Self, _ b: Self) -> Self {
        a.combine(b)
    }
    
    /// Combines a variable number of values (at least one) of the implementing type, in the order provided in the call.
    ///
    /// - Parameters:
    ///     - first: First value of the implementing type.
    ///     - rest: Values of the implementing type.
    /// - Returns: A single value of the implementing type representing the combination of all the parameter values.
    static func combineAll(_ first: Self, _ rest: Self...) -> Self {
        combineAll(first, rest)
    }
    
    /// Combines an array of values of the implementing type, in the order provided in the call.
    ///
    /// - Parameters:
    ///     - first: First value of the implementing type.
    ///     - elems: Values of the implementing type.
    /// - Returns: A single value of the implementing type representing the combination of all the parameter values.
    static func combineAll(_ first: Self, _ rest: [Self]) -> Self {
        rest.reduce(first, Self.combine)
    }
}
