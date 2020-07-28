public extension Writer where Accumulator: Monoid {
    /// Embeds a writer action.
    ///
    /// - Parameter pair: A tupe of the writer type and a value.
    /// - Returns: The writer action embedded in this context.
    static func writer(_ pair: (Accumulator, Value)) -> Writer<Accumulator, Value> {
        Writer(pair.0, pair.1)
    }
    
    /// Adds the side stream of data to the result of a computation.
    ///
    /// - Returns: The result of the computation paired with the side stream of data.
    func listen() -> Writer<Accumulator, (Accumulator, Value)> {
        Writer<Accumulator, (Accumulator, Value)>(
            self.accumulator,
            (self.accumulator, self.value)
        )
    }
    
    /// Performs a computation and transforms the side stream of data, pairing it with the result of the computation.
    ///
    /// - Parameters:
    ///   - f: A function to transform the side stream of data.
    /// - Returns: A tuple of the transformation of the side stream and the result of the computation.
    func listens(_ f: @escaping (Accumulator) -> Accumulator) -> Writer<Accumulator, (Accumulator, Value)> {
        self.listen().map { pair in (f(pair.0), pair.1) }
    }
    
    /// Performs a computation and transforms the side stream of data.
    ///
    /// - Returns: Result of the computation.
    func pass<A>() -> Writer<Accumulator, A> where Value == ((Accumulator) -> Accumulator, A) {
        Writer<Accumulator, A>(self.value.0(self.accumulator), self.value.1)
    }
    
    /// Transforms the side stream of data of a given computation.
    ///
    /// - Parameters:
    ///   - f: Transforming function.
    /// - Returns: A computation with the same result as the provided one, with the transformed side stream of data.
    func censor(_ f: @escaping (Accumulator) -> Accumulator) -> Writer<Accumulator, Value> {
        self.map { value in (f, value) }.pass()
    }
}

public extension Writer where Accumulator: Monoid, Value == Void {
    /// Produces a new value of the side stream of data.
    ///
    /// - Parameter w: New value.
    /// - Returns: Unit.
    static func tell(_ accumulator: Accumulator) -> Writer<Accumulator, Void> {
        Writer(accumulator, ())
    }
}
