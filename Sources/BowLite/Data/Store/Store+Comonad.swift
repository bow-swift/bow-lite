public extension Store {
    func extract() -> View {
        self.render(self.state)
    }
    
    func coflatMap<B>(_ f: @escaping (Store<State, View>) -> B) -> Store<State, B> {
        Store<State, B>(state: self.state) { state in
            f(Store(state: state, render: self.render))
        }
    }
    
    func duplicate() -> Store<State, Store<State, View>> {
        coflatMap(id)
    }
}
