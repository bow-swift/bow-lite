public extension Function {
    static func lift<B>(_ f: @escaping (Output) -> B) -> (Function<Input, Output>) -> Function<Input, B> {
        { function in function.map(f) }
    }
    
    func `as`<B>(_ b: B) -> Function<Input, B> {
        self.map(constant(b))
    }
    
    func void() -> Function<Input, Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Output) -> B) -> Function<Input, (Output, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> Function<Input, (B, Output)> {
        self.map { a in (b, a) }
    }
    
    func tupleOutput<B>(_ b: B) -> Function<Input, (Output, B)> {
        self.map { a in (a, b) }
    }
}
