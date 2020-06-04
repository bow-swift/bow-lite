public extension Ior {
    func map<B>(_ f: @escaping (Right) -> B) -> Ior<Left, B> {
        bimap(id, f)
    }
    
    static func lift<B>(_ f: @escaping (Right) -> B) -> (Ior<Left, Right>) -> Ior<Left, B> {
        { ior in ior.map(f) }
    }
    
    func `as`<B>(_ b: B) -> Ior<Left, B> {
        self.map(constant(b))
    }
    
    func void() -> Ior<Left, Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Right) -> B) -> Ior<Left, (Right, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> Ior<Left, (B, Right)> {
        self.map { a in (b, a) }
    }
    
    func tupleRight<B>(_ b: B) -> Ior<Left, (Right, B)> {
        self.map { a in (a, b) }
    }
}
