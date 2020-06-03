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
