public extension EnvIO {
    static func lift<B>(_ f: @escaping (Success) -> B) -> (EnvIO<Dependencies, Failure, Success>) -> EnvIO<Dependencies, Failure, B> {
        { either in either.map(f) }
    }
    
    func `as`<B>(_ b: B) -> EnvIO<Dependencies, Failure, B> {
        self.map(constant(b))
    }
    
    func void() -> EnvIO<Dependencies, Failure, Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Success) -> B) -> EnvIO<Dependencies, Failure, (Success, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> EnvIO<Dependencies, Failure, (B, Success)> {
        self.map { a in (b, a) }
    }
    
    func tupleSuccess<B>(_ b: B) -> EnvIO<Dependencies, Failure, (Success, B)> {
        self.map { a in (a, b) }
    }
}
