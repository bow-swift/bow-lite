public extension Try {
    func map<A>(_ f: @escaping (Success) -> A) -> Try<A> {
        fold(Try<A>.failure, Try<A>.success <<< f)
    }
    
    static func lift<B>(_ f: @escaping (Success) -> B) -> (Try<Success>) -> Try<B> {
        { aTry in aTry.map(f) }
    }
    
    func `as`<B>(_ b: B) -> Try<B> {
        self.map(constant(b))
    }
    
    func void() -> Try<Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Success) -> B) -> Try<(Success, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> Try<(B, Success)> {
        self.map { a in (b, a) }
    }
    
    func tupleSuccess<B>(_ b: B) -> Try<(Success, B)> {
        self.map { a in (a, b) }
    }
}

