/// State represents operations that need to write and read a state through a computation.
///
/// Some computations may not require the full power of this type:
///     - For read-only state, see `Reader` / `Function`.
///     - To accumulate a value without using it on the way, see `Writer`.
public struct State<StateType, Value> {
    private let f: (StateType) -> (StateType, Value)
    
    /// Initializes a `StateT`.
    ///
    /// - Parameter f: A function that receives a state and produces an updates to such state and a value.
    public init(_ f: @escaping (StateType) -> (StateType, Value)) {
        self.f = f
    }
    
    /// Invokes this value with an initial state.
    ///
    /// - Parameter initialState: Initial state to be fed in the state-based function.
    /// - Returns: A tuple with the final state and result.
    public func callAsFunction(_ initialState: StateType) -> (StateType, Value) {
        f(initialState)
    }
    
    /// Invokes this value with an initial state.
    ///
    /// - Parameter initialState: Initial state to be fed in the state-based function.
    /// - Returns: Final state resulting from the evaluation of the computation.
    public func runState(_ initialState: StateType) -> StateType {
        self(initialState).0
    }
    
    /// Invokes this value with an initial state.
    ///
    /// - Parameter initialState: Initial state to be fed in the state-based function.
    /// - Returns: Final value resulting from the evaluation of the computation.
    public func runValue(_ initialState: StateType) -> Value {
        self(initialState).1
    }
    
    /// Modifies the state type of this computation using to functions to get and set part of this state from a larger state.
    ///
    /// - Parameters:
    ///   - getter: Getter function to obtain part of the parent state.
    ///   - setter: Setter function to set a new value in the parent state.
    /// - Returns: A new state focused on a new state type.
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
