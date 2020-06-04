public struct Store<State, View> {
    public let state: State
    public let render: (State) -> View
    
    public init(state: State, render: @escaping (State) -> View) {
        self.state = state
        self.render = render
    }
}
