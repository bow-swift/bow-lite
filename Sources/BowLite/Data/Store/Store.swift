/// Store represents values of type `View` that depend on a certain position of type `State`.
public struct Store<State, View> {
    /// Current focus of this store.
    public let state: State
    
    /// Function that yields values that depend on the focus type.
    public let render: (State) -> View
    
    /// Initializes a store.
    ///
    /// - Parameters:
    ///   - state: Initial focus.
    ///   - render: Rendering function.
    public init(state: State, render: @escaping (State) -> View) {
        self.state = state
        self.render = render
    }
}
