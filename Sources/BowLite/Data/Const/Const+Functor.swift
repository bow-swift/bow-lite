public extension Const {
    func map<B>(_ f: @escaping (Variable) -> B) -> Const<Constant, B> {
        self.retag()
    }
    
    static func lift<B>(_ f: @escaping (Variable) -> B) -> (Const<Constant, Variable>) -> Const<Constant, B> {
        { const in const.map(f) }
    }
    
    func `as`<B>(_ b: B) -> Const<Constant, B> {
        self.map(constant(b))
    }
    
    func void() -> Const<Constant, Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Variable) -> B) -> Const<Constant, (Variable, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> Const<Constant, (B, Variable)> {
        self.map { a in (b, a) }
    }
    
    func tupleVariable<B>(_ b: B) -> Const<Constant, (Variable, B)> {
        self.map { a in (a, b) }
    }
}
