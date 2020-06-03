public protocol Semiring: Monoid {
    func multiply(_ other: Self) -> Self
    static var zero: Self { get }
    static var one: Self { get }
}

public extension Semiring {
    static var empty: Self {
        Self.empty
    }
    
    func add(_ other: Self) -> Self {
        self.combine(other)
    }
}