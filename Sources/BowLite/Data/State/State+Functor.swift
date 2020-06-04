public extension State {
    func map<B>(_ f: @escaping (Value) -> B) -> State<StateType, B> {
        State<StateType, B> { state in
            let (newState, value) = self(state)
            return (newState, f(value))
        }
    }
    
    static func lift<B>(_ f: @escaping (Value) -> B) -> (State<StateType, Value>) -> State<StateType, B> {
        { state in state.map(f) }
    }
    
    func `as`<B>(_ b: B) -> State<StateType, B> {
        self.map(constant(b))
    }
    
    func void() -> State<StateType, Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Value) -> B) -> State<StateType, (Value, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> State<StateType, (B, Value)> {
        self.map { a in (b, a) }
    }
    
    func tupleValue<B>(_ b: B) -> State<StateType, (Value, B)> {
        self.map { a in (a, b) }
    }
}
