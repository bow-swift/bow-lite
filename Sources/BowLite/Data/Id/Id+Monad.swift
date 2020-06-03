public extension Id {
    func flatMap<A>(_ f: @escaping (Wrapped) -> Id<A>) -> Id<A> {
        f(self.value)
    }
    
    func flatten<A>() -> Id<A> where Wrapped == Id<A> {
        self.flatMap(id)
    }
    
    func followedBy<A>(_ fa: Id<A>) -> Id<A> {
        self.flatMap(constant(fa))
    }
    
    func forEffect<A>(_ fa: Id<A>) -> Id<Wrapped> {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    func mproduct<A>(_ f: @escaping (Wrapped) -> Id<A>) -> Id<(Wrapped, A)> {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    func `if`<A>(
        then f: @escaping () -> Id<A>,
        else g: @escaping () -> Id<A>
    ) -> Id<A> where Wrapped == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    func flatTap<A>(_ f: @escaping (Wrapped) -> Id<A>) -> Id<Wrapped> {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
