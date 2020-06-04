public extension State where StateType == Value {
    static func get() -> State<StateType, StateType> {
        State { state in (state, state) }
    }
}

public extension State where Value == Void {
    static func set(_ newState: StateType) -> State<StateType, Void> {
        State { _ in (newState, ()) }
    }
    
    static func modify(_ f: @escaping (StateType) -> StateType) -> State<StateType, Void> {
        State { state in (f(state), ()) }
    }
}

public extension State {
    static func state(_ f: @escaping (StateType) -> (StateType, Value)) -> State<StateType, Value> {
        State(f)
    }
    
    static func inspect(_ f: @escaping (StateType) -> Value) -> State<StateType, Value> {
        State<StateType, StateType>.get().map(f)
    }
}
