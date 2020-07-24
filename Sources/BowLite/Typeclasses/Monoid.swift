/// A monoid is an algebraic structure that has the same properties as a semigroup, with an empty element.
public protocol Monoid: Semigroup {
    /// Empty element.
    ///
    /// The empty element must obey the monoid laws:
    ///
    ///     a.combine(.empty) == .empty.combine(a) == a
    ///
    /// That is, combining any element with `empty` must return the original element.
    ///
    /// - Returns: A value of the implementing type satisfying the monoid laws.
    static var empty: Self { get }
}

// MARK: Monoid syntax
public extension Monoid {
    /// Combines a variable number of values of the implementing type, in the order provided in the call.
    ///
    /// - Parameters:
    ///     - elements: Values of the implementing type.
    /// - Returns: A single value of the implementing type representing the combination of all the parameter values.
    static func combineAll(_ elements: Self...) -> Self {
        combineAll(elements)
    }
    
    /// Combines an array of values of the implementing type, in the order provided in the call.
    ///
    /// - Parameters:
    ///     - elements: Values of the implementing type.
    /// - Returns: A single value of the implementing type representing the combination of all the parameter values.
    static func combineAll(_ elements: [Self]) -> Self {
        elements.reduce(Self.empty, Self.combine)
    }
}
