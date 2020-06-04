public extension Writer {
    func map<B>(_ f: @escaping (Value) -> B) -> Writer<Accumulator, B> {
        Writer<Accumulator, B>(self.accumulator, f(self.value))
    }
    
    static func lift<B>(_ f: @escaping (Value) -> B) -> (Writer<Accumulator, Value>) -> Writer<Accumulator, B> {
        { either in either.map(f) }
    }
    
    func `as`<B>(_ b: B) -> Writer<Accumulator, B> {
        self.map(constant(b))
    }
    
    func void() -> Writer<Accumulator, Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Value) -> B) -> Writer<Accumulator, (Value, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> Writer<Accumulator, (B, Value)> {
        self.map { a in (b, a) }
    }
    
    func tupleValue<B>(_ b: B) -> Writer<Accumulator, (Value, B)> {
        self.map { a in (a, b) }
    }
}
