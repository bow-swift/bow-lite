public struct State<StateType, Value> {
    private let f: (StateType) -> (StateType, Value)
    
    public init(_ f: @escaping (StateType) -> (StateType, Value)) {
        self.f = f
    }
    
    public func callAsFunction(_ initialState: StateType) -> (StateType, Value) {
        f(initialState)
    }
    
    public func runState(_ initialState: StateType) -> StateType {
        self(initialState).0
    }
    
    public func runValue(_ initialState: StateType) -> Value {
        self(initialState).1
    }
    
    public func focus<S>(
        _ getter: @escaping (S) -> StateType,
        _ setter: @escaping (S, StateType) -> S
    ) -> State<S, Value> {
        State<S, Value> { state in
            let (newState, result) = self(getter(state))
            return (setter(state, newState), result)
        }
    }
}
