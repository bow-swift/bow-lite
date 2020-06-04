public extension Store {
    var position: State {
        self.state
    }
    
    func peek(_ state: State) -> View {
        self.render(state)
    }
    
    func peeks(_ f: @escaping (State) -> State) -> View {
        peek(f(self.state))
    }
    
    func seek(_ state: State) -> Store<State, View> {
        coflatMap { store in store.peek(state) }
    }
    
    func seeks(_ f: @escaping (State) -> State) -> Store<State, View> {
        coflatMap { store in store.peeks(f) }
    }
    
    func move(_ newState: State) -> Store<State, View> {
        duplicate().peek(newState)
    }
}
