public extension Store where State: Monoid {
    static func pure(_ view: View) -> Store<State, View> {
        Store(state: .empty, render: constant(view))
    }
    
    static func zip<A, B>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>
    ) -> Store<State, (A, B)> where View == (A, B) {
        Store(state: State.combineAll(fa.state, fb.state)) { state in
            (fa.render(state), fb.render(state))
        }
    }
    
    static func zip<A, B, C>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>
    ) -> Store<State, (A, B, C)> where View == (A, B, C) {
        Store(state: State.combineAll(fa.state, fb.state, fc.state)) { state in
            (fa.render(state),
             fb.render(state),
             fc.render(state))
        }
    }
    
    static func zip<A, B, C, D>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ fd: Store<State, D>
    ) -> Store<State, (A, B, C, D)> where View == (A, B, C, D) {
        Store(state: State.combineAll(fa.state, fb.state, fc.state, fd.state)) { state in
            (fa.render(state),
             fb.render(state),
             fc.render(state),
             fd.render(state))
        }
    }
    
    static func zip<A, B, C, D, E>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ fd: Store<State, D>,
        _ fe: Store<State, E>
    ) -> Store<State, (A, B, C, D, E)> where View == (A, B, C, D, E) {
        Store(state: State.combineAll(fa.state, fb.state, fc.state, fd.state, fe.state)) { state in
            (fa.render(state),
             fb.render(state),
             fc.render(state),
             fd.render(state),
             fe.render(state))
        }
    }
    
    static func zip<A, B, C, D, E, F>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ fd: Store<State, D>,
        _ fe: Store<State, E>,
        _ ff: Store<State, F>
    ) -> Store<State, (A, B, C, D, E, F)> where View == (A, B, C, D, E, F) {
        Store(state: State.combineAll(fa.state, fb.state, fc.state, fd.state, fe.state, ff.state)) { state in
            (fa.render(state),
             fb.render(state),
             fc.render(state),
             fd.render(state),
             fe.render(state),
             ff.render(state))
        }
    }
    
    static func zip<A, B, C, D, E, F, G>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ fd: Store<State, D>,
        _ fe: Store<State, E>,
        _ ff: Store<State, F>,
        _ fg: Store<State, G>
    ) -> Store<State, (A, B, C, D, E, F, G)> where View == (A, B, C, D, E, F, G) {
        Store(state: State.combineAll(fa.state, fb.state, fc.state, fd.state, fe.state, ff.state, fg.state)) { state in
            (fa.render(state),
             fb.render(state),
             fc.render(state),
             fd.render(state),
             fe.render(state),
             ff.render(state),
             fg.render(state))
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ fd: Store<State, D>,
        _ fe: Store<State, E>,
        _ ff: Store<State, F>,
        _ fg: Store<State, G>,
        _ fh: Store<State, H>
    ) -> Store<State, (A, B, C, D, E, F, G, H)> where View == (A, B, C, D, E, F, G, H) {
        Store(state: State.combineAll(fa.state, fb.state, fc.state, fd.state, fe.state, ff.state, fg.state, fh.state)) { state in
            (fa.render(state),
             fb.render(state),
             fc.render(state),
             fd.render(state),
             fe.render(state),
             ff.render(state),
             fg.render(state),
             fh.render(state))
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H, I>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ fd: Store<State, D>,
        _ fe: Store<State, E>,
        _ ff: Store<State, F>,
        _ fg: Store<State, G>,
        _ fh: Store<State, H>,
        _ fi: Store<State, I>
    ) -> Store<State, (A, B, C, D, E, F, G, H, I)> where View == (A, B, C, D, E, F, G, H, I) {
        Store(state: State.combineAll(fa.state, fb.state, fc.state, fd.state, fe.state, ff.state, fg.state, fh.state, fi.state)) { state in
            (fa.render(state),
             fb.render(state),
             fc.render(state),
             fd.render(state),
             fe.render(state),
             ff.render(state),
             fg.render(state),
             fh.render(state),
             fi.render(state))
        }
    }
    
    static func map<A, B>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ f: @escaping (A, B) -> View
    ) -> Store<State, View> {
        Store<State, (A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ f: @escaping (A, B, C) -> View
    ) -> Store<State, View> {
        Store<State, (A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ fd: Store<State, D>,
        _ f: @escaping (A, B, C, D) -> View
    ) -> Store<State, View> {
        Store<State, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    static func map<A, B, C, D, E>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ fd: Store<State, D>,
        _ fe: Store<State, E>,
        _ f: @escaping (A, B, C, D, E) -> View
    ) -> Store<State, View> {
        Store<State, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
    }
    
    static func map<A, B, C, D, E, F>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ fd: Store<State, D>,
        _ fe: Store<State, E>,
        _ ff: Store<State, F>,
        _ f: @escaping (A, B, C, D, E, F) -> View
    ) -> Store<State, View> {
        Store<State, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
    }
    
    static func map<A, B, C, D, E, F, G>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ fd: Store<State, D>,
        _ fe: Store<State, E>,
        _ ff: Store<State, F>,
        _ fg: Store<State, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> View
    ) -> Store<State, View> {
        Store<State, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ fd: Store<State, D>,
        _ fe: Store<State, E>,
        _ ff: Store<State, F>,
        _ fg: Store<State, G>,
        _ fh: Store<State, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> View
    ) -> Store<State, View> {
        Store<State, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H, I>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ fd: Store<State, D>,
        _ fe: Store<State, E>,
        _ ff: Store<State, F>,
        _ fg: Store<State, G>,
        _ fh: Store<State, H>,
        _ fi: Store<State, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> View
    ) -> Store<State, View> {
        Store<State, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    func ap<A, B>(_ fa: Store<State, A>) -> Store<State, B> where View == (A) -> B {
        Store<State, B>(state: self.state.combine(fa.state)) { state in
            self.render(state)(fa.render(state))
        }
    }
    
    func zipView<B>(_ fb: Store<State, B>) -> Store<State, B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: Store<State, B>) -> Store<State, View> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
