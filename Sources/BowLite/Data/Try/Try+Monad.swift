public extension Try {
    func flatMap<A>(_ f: @escaping (Success) -> Try<A>) -> Try<A> {
        fold(Try<A>.failure, f)
    }
    
    func flatten<A>() -> Try<A> where Success == Try<A> {
        self.flatMap(id)
    }
    
    func followedBy<A>(_ fa: Try<A>) -> Try<A> {
        self.flatMap(constant(fa))
    }
    
    func forEffect<A>(_ fa: Try<A>) -> Try<Success> {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    func mproduct<A>(_ f: @escaping (Success) -> Try<A>) -> Try<(Success, A)> {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    func `if`<A>(
        then f: @escaping () -> Try<A>,
        else g: @escaping () -> Try<A>
    ) -> Try<A> where Success == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    func flatTap<A>(_ f: @escaping (Success) -> Try<A>) -> Try<Success> {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
