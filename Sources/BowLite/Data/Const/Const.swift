public struct Const<Constant, Variable> {
    public let value: Constant
    
    public init(_ value: Constant) {
        self.value = value
    }
    
    public func retag<Other>() -> Const<Constant, Other> {
        Const<Constant, Other>(value)
    }
}

extension Const: Semigroup where Constant: Semigroup {
    public func combine(_ other: Const<Constant, Variable>) -> Const<Constant, Variable> {
        Const(self.value.combine(other.value))
    }
}

extension Const: Monoid where Constant: Monoid {
    public static var empty: Const<Constant, Variable> {
        Const(.empty)
    }
}
