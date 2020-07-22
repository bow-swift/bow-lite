public extension IO {
    static func lift<B>(_ f: @escaping (Success) -> B) -> (IO<Failure, Success>) -> IO<Failure, B> {
        { either in either.map(f) }
    }
    
    func `as`<B>(_ b: B) -> IO<Failure, B> {
        self.map(constant(b))
    }
    
    func void() -> IO<Failure, Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Success) -> B) -> IO<Failure, (Success, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> IO<Failure, (B, Success)> {
        self.map { a in (b, a) }
    }
    
    func tupleSuccess<B>(_ b: B) -> IO<Failure, (Success, B)> {
        self.map { a in (a, b) }
    }
}
