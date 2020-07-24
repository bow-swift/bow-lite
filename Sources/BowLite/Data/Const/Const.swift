/// Constant data type. Represents a container of two types, holding a value of the left type that remains constant, regardless of the transformation applied to it.
public struct Const<Constant, Variable> {
    public let value: Constant
    
    /// Initializes a constant value.
    ///
    /// - Parameter value: Constant value to be wrapped.
    public init(_ value: Constant) {
        self.value = value
    }
    
    /// Changes the type of the right type argument associated to this constant value.
    ///
    /// - Returns: The same wrapped value, changing the right type argument.
    public func retag<Other>() -> Const<Constant, Other> {
        Const<Constant, Other>(value)
    }
}

// MARK: Instance of Semigroup for Const

extension Const: Semigroup where Constant: Semigroup {
    public func combine(_ other: Const<Constant, Variable>) -> Const<Constant, Variable> {
        Const(self.value.combine(other.value))
    }
}

// MARK: Instance of Monoid for Const

extension Const: Monoid where Constant: Monoid {
    public static var empty: Const<Constant, Variable> {
        Const(.empty)
    }
}

// MARK: Conformance to CustomStringConvertible for Const

extension Const: CustomStringConvertible where Constant: CustomStringConvertible {
    public var description: String {
        "Const(\(self.value.description))"
    }
}
