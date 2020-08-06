/// Writer represents operations that accumulate values through a computation, without reading them.
public struct Writer<Accumulator, Value> {
    /// Side stream of accumulated data through computations.
    public let accumulator: Accumulator
    
    /// Value of the computation.
    public let value: Value
    
    /// Initializes a Writer.
    ///
    /// - Parameters:
    ///   - accumulator: Initial value for the side strem of accumulated data.
    ///   - value: Initial value for the computation.
    public init(_ accumulator: Accumulator, _ value: Value) {
        self.accumulator = accumulator
        self.value = value
    }
}

// MARK: Conformance to Equatable for Writer
extension Writer: Equatable where Accumulator: Equatable, Value: Equatable {}

// MARK: Conformance to CustomStringConvertible for Writer
extension Writer: CustomStringConvertible where Accumulator: CustomStringConvertible, Value: CustomStringConvertible {
    public var description: String {
        "Writer(\(accumulator.description), \(value.description))"
    }
}
