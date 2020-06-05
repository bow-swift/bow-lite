public extension Writer where Accumulator: Monoid {
    static func writer(_ pair: (Accumulator, Value)) -> Writer<Accumulator, Value> {
        Writer(pair.0, pair.1)
    }
    
    func listen() -> Writer<Accumulator, (Accumulator, Value)> {
        Writer<Accumulator, (Accumulator, Value)>(
            self.accumulator,
            (self.accumulator, self.value)
        )
    }
    
    func listens(_ f: @escaping (Accumulator) -> Accumulator) -> Writer<Accumulator, (Accumulator, Value)> {
        self.listen().map { pair in (f(pair.0), pair.1) }
    }
    
    func pass<A>() -> Writer<Accumulator, A> where Value == ((Accumulator) -> Accumulator, A) {
        Writer<Accumulator, A>(self.value.0(self.accumulator), self.value.1)
    }
    
    func censor(_ f: @escaping (Accumulator) -> Accumulator) -> Writer<Accumulator, Value> {
        self.map { value in (f, value) }.pass()
    }
}

public extension Writer where Accumulator: Monoid, Value == Void {
    static func tell(_ accumulator: Accumulator) -> Writer<Accumulator, Void> {
        Writer(accumulator, ())
    }
}
