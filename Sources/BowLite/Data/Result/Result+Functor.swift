public extension Result {
    static func lift<B>(_ f: @escaping (Success) -> B) -> (Result<Success, Failure>) -> Result<B, Failure> {
        { result in result.map(f) }
    }
    
    func `as`<B>(_ b: B) -> Result<B, Failure> {
        self.map(constant(b))
    }
    
    func void() -> Result<Void, Failure> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Success) -> B) -> Result<(Success, B), Failure> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> Result<(B, Success), Failure> {
        self.map { a in (b, a) }
    }
    
    func tupleSuccess<B>(_ b: B) -> Result<(Success, B), Failure> {
        self.map { a in (a, b) }
    }
}
