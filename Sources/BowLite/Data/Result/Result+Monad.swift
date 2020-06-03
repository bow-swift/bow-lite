public extension Result {
    func flatten<A>() -> Result<A, Failure> where Success == Result<A, Failure> {
        self.flatMap(id)
    }
    
    func followedBy<A>(_ fa: Result<A, Failure>) -> Result<A, Failure> {
        self.flatMap(constant(fa))
    }
    
    func forEffect<A>(_ fa: Result<A, Failure>) -> Result<Success, Failure> {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    func mproduct<A>(_ f: @escaping (Success) -> Result<A, Failure>) -> Result<(Success, A), Failure> {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    func `if`<A>(
        then f: @escaping () -> Result<A, Failure>,
        else g: @escaping () -> Result<A, Failure>
    ) -> Result<A, Failure> where Success == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    func flatTap<A>(_ f: @escaping (Success) -> Result<A, Failure>) -> Result<Success, Failure> {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
