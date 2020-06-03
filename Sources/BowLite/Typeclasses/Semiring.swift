public protocol Semiring: Monoid {
    func multiply(_ other: Self) -> Self
    static var one: Self { get }
}

public extension Semiring {
    static var zero: Self {
        Self.empty
    }
    
    func add(_ other: Self) -> Self {
        self.combine(other)
    }
}
