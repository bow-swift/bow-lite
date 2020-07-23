public extension Eval {
    static func lift<B>(_ f: @escaping (Value) -> B) -> (Eval<Value>) -> Eval<B> {
        { either in either.map(f) }
    }
    
    func `as`<B>(_ b: B) -> Eval<B> {
        self.map(constant(b))
    }
    
    func void() -> Eval<Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Value) -> B) -> Eval<(Value, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> Eval<(B, Value)> {
        self.map { a in (b, a) }
    }
    
    func tupleValue<B>(_ b: B) -> Eval<(Value, B)> {
        self.map { a in (a, b) }
    }
}
