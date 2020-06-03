public extension Either {
    func flatten<A>() -> Either<Left, A> where Right == Either<Left, A> {
        self.flatMap(id)
    }
    
    func followedBy<A>(_ fa: Either<Left, A>) -> Either<Left, A> {
        self.flatMap(constant(fa))
    }
    
    func forEffect<A>(_ fa: Either<Left, A>) -> Either<Left, Right> {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    func mproduct<A>(_ f: @escaping (Right) -> Either<Left, A>) -> Either<Left, (Right, A)> {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    func `if`<A>(
        then f: @escaping () -> Either<Left, A>,
        else g: @escaping () -> Either<Left, A>
    ) -> Either<Left, A> where Right == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    func flatTap<A>(_ f: @escaping (Right) -> Either<Left, A>) -> Either<Left, Right> {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
