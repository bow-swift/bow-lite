public extension Store {
    /// Extracts the focused value of this context.
    ///
    /// - Returns: Focused value in this context.
    func extract() -> View {
        self.render(self.state)
    }
    
    /// Applies a context-dependent function to this structure.
    ///
    /// - Parameters:
    ///   - f: Context-dependent function.
    /// - Returns: The result of applying the context-dependent function over the entire structure of this value.
    func coflatMap<B>(_ f: @escaping (Store<State, View>) -> B) -> Store<State, B> {
        Store<State, B>(state: self.state) { state in
            f(Store(state: state, render: self.render))
        }
    }
    
    /// Wraps a value in another layer of this context.
    ///
    /// - Returns: Value wrapped in another context layer.
    func duplicate() -> Store<State, Store<State, View>> {
        coflatMap(id)
    }
}
