public extension State where StateType == Value {
    /// Retrieves the state from the internals of the monad.
    ///
    /// - Returns: Maintained state.
    static func get() -> State<StateType, StateType> {
        State { state in (state, state) }
    }
}

public extension State where Value == Void {
    /// Replaces the state inside the monad.
    ///
    /// - Parameter s: New state.
    /// - Returns: Unit value with the new state.
    static func set(_ newState: StateType) -> State<StateType, Void> {
        State { _ in (newState, ()) }
    }
    
    /// Modifies the internal state.
    ///
    /// - Parameter f: Function that modifies the state.
    /// - Returns: Unit value with the modified state.
    static func modify(_ f: @escaping (StateType) -> StateType) -> State<StateType, Void> {
        State { state in (f(state), ()) }
    }
}

public extension State {
    /// Embeds a state action into this monad.
    ///
    /// - Parameter f: A function that receives the state and computes a value and a new state.
    /// - Returns: A value with the output of the function and the new state.
    static func state(_ f: @escaping (StateType) -> (StateType, Value)) -> State<StateType, Value> {
        State(f)
    }
    
    /// Retrieves a specific component of the state.
    ///
    /// - Parameter f: Projection function to obtain part of the state.
    /// - Returns: A specific part of the state.
    static func inspect(_ f: @escaping (StateType) -> Value) -> State<StateType, Value> {
        State<StateType, StateType>.get().map(f)
    }
}
