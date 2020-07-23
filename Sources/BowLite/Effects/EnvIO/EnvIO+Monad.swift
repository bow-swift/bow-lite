public extension EnvIO {
    func flatten<A>() -> EnvIO<Dependencies, Failure, A> where Success == EnvIO<Dependencies, Failure, A> {
        self.flatMap(id)
    }
    
    func followedBy<A>(_ fa: EnvIO<Dependencies, Failure, A>) -> EnvIO<Dependencies, Failure, A> {
        self.flatMap(constant(fa))
    }
    
    func forEffect<A>(_ fa: EnvIO<Dependencies, Failure, A>) -> EnvIO<Dependencies, Failure, Success> {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    func mproduct<A>(_ f: @escaping (Success) -> EnvIO<Dependencies, Failure, A>) -> EnvIO<Dependencies, Failure, (Success, A)> {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    func `if`<A>(
        then f: @escaping () -> EnvIO<Dependencies, Failure, A>,
        else g: @escaping () -> EnvIO<Dependencies, Failure, A>
    ) -> EnvIO<Dependencies, Failure, A> where Success == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    func flatTap<A>(_ f: @escaping (Success) -> EnvIO<Dependencies, Failure, A>) -> EnvIO<Dependencies, Failure, Success> {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
