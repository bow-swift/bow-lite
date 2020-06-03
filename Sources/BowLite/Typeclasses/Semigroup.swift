public protocol Semigroup {
    func combine(_ other: Self) -> Self
}

public extension Semigroup {
    static func combine(_ a: Self, _ b: Self) -> Self {
        a.combine(b)
    }
    
    static func combineAll(_ first: Self, _ rest: Self...) -> Self {
        combineAll(first, rest)
    }
    
    static func combineAll(_ first: Self, _ rest: [Self]) -> Self {
        rest.reduce(first, Self.combine)
    }
}
