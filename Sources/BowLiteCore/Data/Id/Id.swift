/// The identity data type represents a context of having no effect on the type it wraps. A instance of `Id<Wrapped>` is isomorphic to an instance of `Wrapped`; it is just wrapped without any additional information.
public struct Id<Wrapped> {
    /// Wrapped value.
    public let value: Wrapped
    
    /// Constructs a value of `Id`.
    ///
    /// - Parameter value: Value to be wrapped in `Id`.
    public init(_ value: Wrapped) {
        self.value = value
    }
}

// MARK: Instance of Semigroup for Id
extension Id: Semigroup where Wrapped: Semigroup {
    public func combine(_ other: Id<Wrapped>) -> Id<Wrapped> {
        Id(self.value.combine(other.value))
    }
}

// MARK: Instance of Monoid for Id
extension Id: Monoid where Wrapped: Monoid {
    public static var empty: Id<Wrapped> {
        Id(.empty)
    }
}

// MARK: Conformance of Equatable for Id
extension Id: Equatable where Wrapped: Equatable {}

// MARK: Conformance of CustomStringConvertible for Id
extension Id: CustomStringConvertible where Wrapped: CustomStringConvertible {
    public var description: String {
        "Id(\(value.description))"
    }
}
