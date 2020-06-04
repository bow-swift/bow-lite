public extension Function {
    func flatMap<A>(_ f: @escaping (Output) -> Function<Input, A>) -> Function<Input, A> {
        Function<Input, A> { input in
            f(self(input))(input)
        }
    }
    
    func flatten<A>() -> Function<Input, A> where Output == Function<Input, A> {
        self.flatMap(id)
    }
    
    func followedBy<A>(_ fa: Function<Input, A>) -> Function<Input, A> {
        self.flatMap(constant(fa))
    }
    
    func forEffect<A>(_ fa: Function<Input, A>) -> Function<Input, Output> {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    func mproduct<A>(_ f: @escaping (Output) -> Function<Input, A>) -> Function<Input, (Output, A)> {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    func `if`<A>(
        then f: @escaping () -> Function<Input, A>,
        else g: @escaping () -> Function<Input, A>
    ) -> Function<Input, A> where Output == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    func flatTap<A>(_ f: @escaping (Output) -> Function<Input, A>) -> Function<Input, Output> {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
