public extension Id {
    static func lift<B>(_ f: @escaping (Wrapped) -> B) -> (Id<Wrapped>) -> Id<B> {
        { id in id.map(f) }
    }
    
    func map<B>(_ f: @escaping (Wrapped) -> B) -> Id<B> {
        Id<B>(f(self.value))
    }
    
    func `as`<B>(_ b: B) -> Id<B> {
        self.map(constant(b))
    }
    
    func void() -> Id<Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Wrapped) -> B) -> Id<(Wrapped, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> Id<(B, Wrapped)> {
        self.map { a in (b, a) }
    }
    
    func tupleWrapped<B>(_ b: B) -> Id<(Wrapped, B)> {
        self.map { a in (a, b) }
    }
}
