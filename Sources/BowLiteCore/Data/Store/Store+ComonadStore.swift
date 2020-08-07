public extension Store {
    /// Obtains the current position of the store.
    ///
    /// - Returns: Current position.
    var position: State {
        self.state
    }
    
    /// Obtains the value stored in the provided position.
    ///
    /// - Parameters:
    ///   - s: Position within the Store.
    /// - Returns: Value stored in the provided position.
    func peek(_ state: State) -> View {
        self.render(state)
    }
    
    /// Obtains a value in a position relative to the current position.
    ///
    /// - Parameters:
    ///   - f: Function to compute the relative position.
    /// - Returns: Value located in a relative position to the current one.
    func peeks(_ f: @escaping (State) -> State) -> View {
        peek(f(self.state))
    }
    
    /// Moves to a new position.
    ///
    /// - Parameters:
    ///   - s: New position.
    /// - Returns: Store focused into the new position.
    func seek(_ state: State) -> Store<State, View> {
        coflatMap { store in store.peek(state) }
    }
    
    /// Moves to a new position relative to the current one.
    ///
    /// - Parameters:
    ///   - f: Function to compute the new position, relative to the current one.
    /// - Returns: Store focused into the new position.
    func seeks(_ f: @escaping (State) -> State) -> Store<State, View> {
        coflatMap { store in store.peeks(f) }
    }
    
    /// Moves the store into a new state.
    ///
    /// - Parameter newState: New state for the store.
    /// - Returns: A new store focused on the provided state.
    func move(_ newState: State) -> Store<State, View> {
        duplicate().peek(newState)
    }
}
