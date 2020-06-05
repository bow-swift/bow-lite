public struct Writer<Accumulator, Value> {
    public let accumulator: Accumulator
    public let value: Value
    
    public init(_ accumulator: Accumulator, _ value: Value) {
        self.accumulator = accumulator
        self.value = value
    }
}

extension Writer: Equatable where Accumulator: Equatable, Value: Equatable {}

extension Writer: CustomStringConvertible where Accumulator: CustomStringConvertible, Value: CustomStringConvertible {
    public var description: String {
        "Writer(\(accumulator.description), \(value.description))"
    }
}
