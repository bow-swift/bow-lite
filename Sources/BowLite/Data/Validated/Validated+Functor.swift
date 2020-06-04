public extension Validated {
    func map<B>(_ f: @escaping (Valid) -> B) -> Validated<Invalid, B> {
        bimap(id, f)
    }
    
    static func lift<B>(_ f: @escaping (Valid) -> B) -> (Validated<Invalid, Valid>) -> Validated<Invalid, B> {
        { validated in validated.map(f) }
    }
    
    func `as`<B>(_ b: B) -> Validated<Invalid, B> {
        self.map(constant(b))
    }
    
    func void() -> Validated<Invalid, Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Valid) -> B) -> Validated<Invalid, (Valid, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> Validated<Invalid, (B, Valid)> {
        self.map { a in (b, a) }
    }
    
    func tupleValid<B>(_ b: B) -> Validated<Invalid, (Valid, B)> {
        self.map { a in (a, b) }
    }
}
