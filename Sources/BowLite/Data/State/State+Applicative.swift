public extension State {
    /// Lifts a value to the this context type.
    ///
    /// - Parameter element: Value to be lifted.
    /// - Returns: Provided value in this context type.
    static func pure(_ value: Value) -> State<StateType, Value> {
        State { state in (state, value) }
    }
    
    /// Creates a tuple out of two values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>
    ) -> State<StateType, (A, B)> where Value == (A, B) {
        State { state in
            let (sa, a) = fa.invoke(state)
            let (sb, b) = fb.invoke(sa)
            return (sb, (a, b))
        }
    }
    
    /// Creates a tuple out of three values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    ///   - fc: 3rd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B, C>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>
    ) -> State<StateType, (A, B, C)> where Value == (A, B, C) {
        State { state in
            let (sa, a) = fa.invoke(state)
            let (sb, b) = fb.invoke(sa)
            let (sc, c) = fc.invoke(sb)
            return (sc, (a, b, c))
        }
    }
    
    /// Creates a tuple out of four values in this context.
    ///
    /// - Parameters:
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B, C, D>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>
    ) -> State<StateType, (A, B, C, D)> where Value == (A, B, C, D) {
        State { state in
            let (sa, a) = fa.invoke(state)
            let (sb, b) = fb.invoke(sa)
            let (sc, c) = fc.invoke(sb)
            let (sd, d) = fd.invoke(sc)
            return (sd, (a, b, c, d))
        }
    }
    
    /// Creates a tuple out of five values in this context.
    ///
    /// - Parameters:
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    ///   - e: 5th value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B, C, D, E>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>,
        _ fe: State<StateType, E>
    ) -> State<StateType, (A, B, C, D, E)> where Value == (A, B, C, D, E) {
        State { state in
            let (sa, a) = fa.invoke(state)
            let (sb, b) = fb.invoke(sa)
            let (sc, c) = fc.invoke(sb)
            let (sd, d) = fd.invoke(sc)
            let (se, e) = fe.invoke(sd)
            return (se, (a, b, c, d, e))
        }
    }
    
    /// Creates a tuple out of six values in this context.
    ///
    /// - Parameters:
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    ///   - e: 5th value of the tuple.
    ///   - f: 6th value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B, C, D, E, F>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>,
        _ fe: State<StateType, E>,
        _ ff: State<StateType, F>
    ) -> State<StateType, (A, B, C, D, E, F)> where Value == (A, B, C, D, E, F) {
        State { state in
            let (sa, a) = fa.invoke(state)
            let (sb, b) = fb.invoke(sa)
            let (sc, c) = fc.invoke(sb)
            let (sd, d) = fd.invoke(sc)
            let (se, e) = fe.invoke(sd)
            let (sf, f) = ff.invoke(se)
            return (sf, (a, b, c, d, e, f))
        }
    }
    
    /// Creates a tuple out of seven values in this context.
    ///
    /// - Parameters:
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    ///   - e: 5th value of the tuple.
    ///   - f: 6th value of the tuple.
    ///   - g: 7th value of the tuple.
    /// - Returns: A tuple in this context.
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
            let (sa, a) = fa.invoke(state)
            let (sb, b) = fb.invoke(sa)
            let (sc, c) = fc.invoke(sb)
            let (sd, d) = fd.invoke(sc)
            let (se, e) = fe.invoke(sd)
            let (sf, f) = ff.invoke(se)
            let (sg, g) = fg.invoke(sf)
            return (sg, (a, b, c, d, e, f, g))
        }
    }
    
    /// Creates a tuple out of eight values in this context.
    ///
    /// - Parameters:
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    ///   - e: 5th value of the tuple.
    ///   - f: 6th value of the tuple.
    ///   - g: 7th value of the tuple.
    ///   - h: 8th value of the tuple.
    /// - Returns: A tuple in this context.
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
            let (sa, a) = fa.invoke(state)
            let (sb, b) = fb.invoke(sa)
            let (sc, c) = fc.invoke(sb)
            let (sd, d) = fd.invoke(sc)
            let (se, e) = fe.invoke(sd)
            let (sf, f) = ff.invoke(se)
            let (sg, g) = fg.invoke(sf)
            let (sh, h) = fh.invoke(sg)
            return (sh, (a, b, c, d, e, f, g, h))
        }
    }
    
    /// Creates a tuple out of nine values in this context.
    ///
    /// - Parameters:
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    ///   - e: 5th value of the tuple.
    ///   - f: 6th value of the tuple.
    ///   - g: 7th value of the tuple.
    ///   - h: 8th value of the tuple.
    ///   - i: 9th value of the tuple.
    /// - Returns: A tuple in this context.
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
            let (sa, a) = fa.invoke(state)
            let (sb, b) = fb.invoke(sa)
            let (sc, c) = fc.invoke(sb)
            let (sd, d) = fd.invoke(sc)
            let (se, e) = fe.invoke(sd)
            let (sf, f) = ff.invoke(se)
            let (sg, g) = fg.invoke(sf)
            let (sh, h) = fh.invoke(sg)
            let (si, i) = fi.invoke(sh)
            return (si, (a, b, c, d, e, f, g, h, i))
        }
    }
    
    /// Combines the result of two computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
    static func map<A, B>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ f: @escaping (A, B) -> Value
    ) -> State<StateType, Value> {
        State<StateType, (A, B)>.zip(fa, fb).map(f)
    }
    
    /// Combines the result of three computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
    static func map<A, B, C>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ f: @escaping (A, B, C) -> Value
    ) -> State<StateType, Value> {
        State<StateType, (A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    /// Combines the result of four computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
    static func map<A, B, C, D>(
        _ fa: State<StateType, A>,
        _ fb: State<StateType, B>,
        _ fc: State<StateType, C>,
        _ fd: State<StateType, D>,
        _ f: @escaping (A, B, C, D) -> Value
    ) -> State<StateType, Value> {
        State<StateType, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    /// Combines the result of five computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
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
    
    /// Combines the result of six computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    ///   - ff: 6th computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
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
    
    /// Combines the result of seven computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    ///   - ff: 6th computation.
    ///   - fg: 7th computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
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
    
    /// Combines the result of eight computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    ///   - ff: 6th computation.
    ///   - fg: 7th computation.
    ///   - fh: 8th computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
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
    
    /// Combines the result of nine computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    ///   - ff: 6th computation.
    ///   - fg: 7th computation.
    ///   - fh: 8th computation.
    ///   - fi: 9th computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
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
    
    /// Sequential application.
    ///
    /// - Parameters:
    ///   - fa: A value in the context implementing this instance.
    /// - Returns: A value in this context, resulting from the transformation of the contained original value with the contained function.
    func ap<A, B>(_ fa: State<StateType, A>) -> State<StateType, B> where Value == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the first.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result of running the second computation after the first one.
    func zipRight<B>(_ fb: State<StateType, B>) -> State<StateType, B> {
        .map(self, fb) { _, b in b }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the second.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result produced from the first computation after both are computed.
    func zipLeft<B>(_ fb: State<StateType, B>) -> State<StateType, Value> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
