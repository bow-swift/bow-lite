public struct Id<Wrapped> {
    public let value: Wrapped
    
    public init(_ value: Wrapped) {
        self.value = value
    }
}

extension Id: Semigroup where Wrapped: Semigroup {
    public func combine(_ other: Id<Wrapped>) -> Id<Wrapped> {
        Id(self.value.combine(other.value))
    }
}

extension Id: Monoid where Wrapped: Monoid {
    public static var empty: Id<Wrapped> {
        Id(.empty)
    }
}

extension Id: Equatable where Wrapped: Equatable {}

extension Id: CustomStringConvertible where Wrapped: CustomStringConvertible {
    public var description: String {
        "Id(\(value.description))"
    }
}
