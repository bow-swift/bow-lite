public extension State {
    func flatMap<A>(_ f: @escaping (Value) -> State<StateType, A>) -> State<StateType, A> {
        State<StateType, A> { state in
            let (newState, value) = self(state)
            return f(value)(newState)
        }
    }
    
    func flatten<A>() -> State<StateType, A> where Value == State<StateType, A> {
        self.flatMap(id)
    }
    
    func followedBy<A>(_ fa: State<StateType, A>) -> State<StateType, A> {
        self.flatMap(constant(fa))
    }
    
    func forEffect<A>(_ fa: State<StateType, A>) -> State<StateType, Value> {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    func mproduct<A>(_ f: @escaping (Value) -> State<StateType, A>) -> State<StateType, (Value, A)> {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    func `if`<A>(
        then f: @escaping () -> State<StateType, A>,
        else g: @escaping () -> State<StateType, A>
    ) -> State<StateType, A> where Value == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    func flatTap<A>(_ f: @escaping (Value) -> State<StateType, A>) -> State<StateType, Value> {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
