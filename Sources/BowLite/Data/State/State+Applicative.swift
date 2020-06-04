public extension State {
    static func pure(_ value: Value) -> State<StateType, Value> {
        State { state in (state, value) }
    }
    
    static func zip<A, B>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>
    ) -> State<StateType, (A, B)> where Value == (A, B) {
        State { state in
            let (sa, a) = fa(state)
            let (sb, b) = fb(sa)
            return (sb, (a, b))
        }
    }
    
    static func zip<A, B, C>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>
    ) -> State<StateType, (A, B, C)> where Value == (A, B, C) {
        State { state in
            let (sa, a) = fa(state)
            let (sb, b) = fb(sa)
            let (sc, c) = fc(sb)
            return (sc, (a, b, c))
        }
    }
    
    static func zip<A, B, C, D>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>
    ) -> State<StateType, (A, B, C, D)> where Value == (A, B, C, D) {
        State { state in
            let (sa, a) = fa(state)
            let (sb, b) = fb(sa)
            let (sc, c) = fc(sb)
            let (sd, d) = fd(sc)
            return (sd, (a, b, c, d))
        }
    }
    
    static func zip<A, B, C, D, E>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>,
        _ fe: State<StateType, E>
    ) -> State<StateType, (A, B, C, D, E)> where Value == (A, B, C, D, E) {
        State { state in
            let (sa, a) = fa(state)
            let (sb, b) = fb(sa)
            let (sc, c) = fc(sb)
            let (sd, d) = fd(sc)
            let (se, e) = fe(sd)
            return (se, (a, b, c, d, e))
        }
    }
    
    static func zip<A, B, C, D, E, F>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>,
        _ fe: State<StateType, E>,
        _ ff: State<StateType, F>
    ) -> State<StateType, (A, B, C, D, E, F)> where Value == (A, B, C, D, E, F) {
        State { state in
            let (sa, a) = fa(state)
            let (sb, b) = fb(sa)
            let (sc, c) = fc(sb)
            let (sd, d) = fd(sc)
            let (se, e) = fe(sd)
            let (sf, f) = ff(se)
            return (sf, (a, b, c, d, e, f))
        }
    }
    
    static func zip<A, B, C, D, E, F, G>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>,
        _ fe: State<StateType, E>,
        _ ff: State<StateType, F>,
        _ fg: State<StateType, G>
    ) -> State<StateType, (A, B, C, D, E, F, G)> where Value == (A, B, C, D, E, F, G) {
        State { state in
            let (sa, a) = fa(state)
            let (sb, b) = fb(sa)
            let (sc, c) = fc(sb)
            let (sd, d) = fd(sc)
            let (se, e) = fe(sd)
            let (sf, f) = ff(se)
            let (sg, g) = fg(sf)
            return (sg, (a, b, c, d, e, f, g))
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>,
        _ fe: State<StateType, E>,
        _ ff: State<StateType, F>,
        _ fg: State<StateType, G>,
        _ fh: State<StateType, H>
    ) -> State<StateType, (A, B, C, D, E, F, G, H)> where Value == (A, B, C, D, E, F, G, H) {
        State { state in
            let (sa, a) = fa(state)
            let (sb, b) = fb(sa)
            let (sc, c) = fc(sb)
            let (sd, d) = fd(sc)
            let (se, e) = fe(sd)
            let (sf, f) = ff(se)
            let (sg, g) = fg(sf)
            let (sh, h) = fh(sg)
            return (sh, (a, b, c, d, e, f, g, h))
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H, I>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>,
        _ fe: State<StateType, E>,
        _ ff: State<StateType, F>,
        _ fg: State<StateType, G>,
        _ fh: State<StateType, H>,
        _ fi: State<StateType, I>
    ) -> State<StateType, (A, B, C, D, E, F, G, H, I)> where Value == (A, B, C, D, E, F, G, H, I) {
        State { state in
            let (sa, a) = fa(state)
            let (sb, b) = fb(sa)
            let (sc, c) = fc(sb)
            let (sd, d) = fd(sc)
            let (se, e) = fe(sd)
            let (sf, f) = ff(se)
            let (sg, g) = fg(sf)
            let (sh, h) = fh(sg)
            let (si, i) = fi(sh)
            return (si, (a, b, c, d, e, f, g, h, i))
        }
    }
    
    static func map<A, B>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ f: @escaping (A, B) -> Value
    ) -> State<StateType, Value> {
        State<StateType, (A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ f: @escaping (A, B, C) -> Value
    ) -> State<StateType, Value> {
        State<StateType, (A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>,
        _ f: @escaping (A, B, C, D) -> Value
    ) -> State<StateType, Value> {
        State<StateType, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    static func map<A, B, C, D, E>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>,
        _ fe: State<StateType, E>,
        _ f: @escaping (A, B, C, D, E) -> Value
    ) -> State<StateType, Value> {
        State<StateType, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
    }
    
    static func map<A, B, C, D, E, F>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>,
        _ fe: State<StateType, E>,
        _ ff: State<StateType, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Value
    ) -> State<StateType, Value> {
        State<StateType, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
    }
    
    static func map<A, B, C, D, E, F, G>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>,
        _ fe: State<StateType, E>,
        _ ff: State<StateType, F>,
        _ fg: State<StateType, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Value
    ) -> State<StateType, Value> {
        State<StateType, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>,
        _ fe: State<StateType, E>,
        _ ff: State<StateType, F>,
        _ fg: State<StateType, G>,
        _ fh: State<StateType, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Value
    ) -> State<StateType, Value> {
        State<StateType, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H, I>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>,
        _ fe: State<StateType, E>,
        _ ff: State<StateType, F>,
        _ fg: State<StateType, G>,
        _ fh: State<StateType, H>,
        _ fi: State<StateType, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Value
    ) -> State<StateType, Value> {
        State<StateType, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    func ap<A, B>(_ fa: State<StateType, A>) -> State<StateType, B> where Value == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    func zipValue<B>(_ fb: State<StateType, B>) -> State<StateType, B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: State<StateType, B>) -> State<StateType, Value> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
