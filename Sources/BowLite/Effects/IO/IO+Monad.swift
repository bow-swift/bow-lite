public extension IO {
    func flatten<A>() -> IO<Failure, A> where Success == IO<Failure, A> {
        self.flatMap(id)
    }
    
    func followedBy<A>(_ fa: IO<Failure, A>) -> IO<Failure, A> {
        self.flatMap(constant(fa))
    }
    
    func forEffect<A>(_ fa: IO<Failure, A>) -> IO<Failure, Success> {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    func mproduct<A>(_ f: @escaping (Success) -> IO<Failure, A>) -> IO<Failure, (Success, A)> {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    func `if`<A>(
        then f: @escaping () -> IO<Failure, A>,
        else g: @escaping () -> IO<Failure, A>
    ) -> IO<Failure, A> where Success == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    func flatTap<A>(_ f: @escaping (Success) -> IO<Failure, A>) -> IO<Failure, Success> {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
