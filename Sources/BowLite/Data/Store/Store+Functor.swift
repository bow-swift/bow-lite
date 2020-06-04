public extension Store {
    func map<B>(_ f: @escaping (View) -> B) -> Store<State, B> {
        Store<State, B>(state: self.state, render: self.render >>> f)
    }
    
    static func lift<B>(_ f: @escaping (View) -> B) -> (Store<State, View>) -> Store<State, B> {
        { store in store.map(f) }
    }
    
    func `as`<B>(_ b: B) -> Store<State, B> {
        self.map(constant(b))
    }
    
    func void() -> Store<State, Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (View) -> B) -> Store<State, (View, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> Store<State, (B, View)> {
        self.map { a in (b, a) }
    }
    
    func tupleView<B>(_ b: B) -> Store<State, (View, B)> {
        self.map { a in (a, b) }
    }
}
