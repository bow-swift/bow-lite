public protocol Monoid: Semigroup {
    static var empty: Self { get }
}

public extension Monoid {
    static func combineAll(_ elements: Self...) -> Self {
        combineAll(elements)
    }
    
    static func combineAll(_ elements: [Self]) -> Self {
        elements.reduce(Self.empty, Self.combine)
    }
}
