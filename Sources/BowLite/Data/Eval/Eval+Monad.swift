public extension Eval {
    func flatten<A>() -> Eval<A> where Value == Eval<A> {
        self.flatMap(id)
    }
    
    func followedBy<A>(_ fa: Eval<A>) -> Eval<A> {
        self.flatMap(constant(fa))
    }
    
    func forEffect<A>(_ fa: Eval<A>) -> Eval<Value> {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    func mproduct<A>(_ f: @escaping (Value) -> Eval<A>) -> Eval<(Value, A)> {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    func `if`<A>(
        then f: @escaping () -> Eval<A>,
        else g: @escaping () -> Eval<A>
    ) -> Eval<A> where Value == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    func flatTap<A>(_ f: @escaping (Value) -> Eval<A>) -> Eval<Value> {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
