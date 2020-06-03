public extension Optional {
    func flatten<A>() -> A? where Wrapped == A? {
        self.flatMap(id)
    }
    
    func followedBy<A>(_ fa: A?) -> A? {
        self.flatMap(constant(fa))
    }
    
    func forEffect<A>(_ fa: A?) -> Wrapped? {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    func mproduct<A>(_ f: @escaping (Wrapped) -> A?) -> (Wrapped, A)? {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    func `if`<A>(
        then f: @escaping () -> A?,
        else g: @escaping () -> A?
    ) -> A? where Wrapped == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    func flatTap<A>(_ f: @escaping (Wrapped) -> A?) -> Wrapped? {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
