public extension Either {
    static func lift<B>(_ f: @escaping (Right) -> B) -> (Either<Left, Right>) -> Either<Left, B> {
        { either in either.map(f) }
    }
    
    func `as`<B>(_ b: B) -> Either<Left, B> {
        self.map(constant(b))
    }
    
    func void() -> Either<Left, Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Right) -> B) -> Either<Left, (Right, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> Either<Left, (B, Right)> {
        self.map { a in (b, a) }
    }
    
    func tupleRight<B>(_ b: B) -> Either<Left, (Right, B)> {
        self.map { a in (a, b) }
    }
}
