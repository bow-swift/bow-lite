public struct Writer<Accumulator, Value> {
    public let accumulator: Accumulator
    public let value: Value
    
    public init(_ accumulator: Accumulator, _ value: Value) {
        self.accumulator = accumulator
        self.value = value
    }
}
