public extension Optional {
    static func lift<B>(_ f: @escaping (Wrapped) -> B) -> (Wrapped?) -> B? {
        { optional in optional.map(f) }
    }
    
    func `as`<B>(_ b: B) -> B? {
        self.map(constant(b))
    }
    
    func void() -> Void? {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Wrapped) -> B) -> (Wrapped, B)? {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> (B, Wrapped)? {
        self.map { a in (b, a) }
    }
    
    func tupleRight<B>(_ b: B) -> (Wrapped, B)? {
        self.map { a in (a, b) }
    }
}
