public extension Store where State: Monoid {
    /// Lifts a value to the this context type.
    ///
    /// - Parameter wrapped: Value to be lifted.
    /// - Returns: Provided value in this context type.
    static func pure(_ view: View) -> Store<State, View> {
        Store(state: .empty, render: constant(view))
    }
    
    /// Creates a tuple out of two values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>
    ) -> Store<State, (A, B)> where View == (A, B) {
        Store(state: State.combineAll(fa.state, fb.state)) { state in
            (fa.render(state), fb.render(state))
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
    
    /// Creates a tuple out of four values in this context.
    ///
    /// - Parameters:
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    /// - Returns: A tuple in this context.
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
    
    /// Combines the result of two computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
    static func map<A, B>(
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ f: @escaping (A, B) -> View
    ) -> Store<State, View> {
        Store<State, (A, B)>.zip(fa, fb).map(f)
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
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ f: @escaping (A, B, C) -> View
    ) -> Store<State, View> {
        Store<State, (A, B, C)>.zip(fa, fb, fc).map(f)
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
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ fd: Store<State, D>,
        _ f: @escaping (A, B, C, D) -> View
    ) -> Store<State, View> {
        Store<State, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
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
        _ fa: Store<State, A>,
        _ fb: Store<State, B>,
        _ fc: Store<State, C>,
        _ fd: Store<State, D>,
        _ fe: Store<State, E>,
        _ f: @escaping (A, B, C, D, E) -> View
    ) -> Store<State, View> {
        Store<State, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
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
    
    /// Sequential application.
    ///
    /// - Parameters:
    ///   - fa: A value in the context implementing this instance.
    /// - Returns: A value in this context, resulting from the transformation of the contained original value with the contained function.
    func ap<A, B>(_ fa: Store<State, A>) -> Store<State, B> where View == (A) -> B {
        Store<State, B>(state: self.state.combine(fa.state)) { state in
            self.render(state)(fa.render(state))
        }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the first.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result of running the second computation after the first one.
    func zipRight<B>(_ fb: Store<State, B>) -> Store<State, B> {
        .map(self, fb) { _, b in b }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the second.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result produced from the first computation after both are computed.
    func zipLeft<B>(_ fb: Store<State, B>) -> Store<State, View> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
