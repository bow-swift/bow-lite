public extension Writer where Accumulator: Monoid {
    /// Lifts a value to the this context type.
    ///
    /// - Parameter wrapped: Value to be lifted.
    /// - Returns: Provided value in this context type.
    static func pure(_ value: Value) -> Writer<Accumulator, Value> {
        Writer(.empty, value)
    }
    
    /// Creates a tuple out of two values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>
    ) -> Writer<Accumulator, (A, B)> where Value == (A, B) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator),
            (fa.value, fb.value))
    }
    
    /// Creates a tuple out of three values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    ///   - fc: 3rd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B, C>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>
    ) -> Writer<Accumulator, (A, B, C)> where Value == (A, B, C) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator,
                fc.accumulator),
            (fa.value, fb.value, fc.value))
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
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>
    ) -> Writer<Accumulator, (A, B, C, D)> where Value == (A, B, C, D) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator,
                fc.accumulator,
                fd.accumulator),
            (fa.value, fb.value, fc.value, fd.value))
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
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>
    ) -> Writer<Accumulator, (A, B, C, D, E)> where Value == (A, B, C, D, E) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator,
                fc.accumulator,
                fd.accumulator,
                fe.accumulator),
            (fa.value, fb.value, fc.value, fd.value, fe.value))
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
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>
    ) -> Writer<Accumulator, (A, B, C, D, E, F)> where Value == (A, B, C, D, E, F) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator,
                fc.accumulator,
                fd.accumulator,
                fe.accumulator,
                ff.accumulator),
            (fa.value, fb.value, fc.value, fd.value, fe.value, ff.value))
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
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>,
        _ fg: Writer<Accumulator, G>
    ) -> Writer<Accumulator, (A, B, C, D, E, F, G)> where Value == (A, B, C, D, E, F, G) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator,
                fc.accumulator,
                fd.accumulator,
                fe.accumulator,
                ff.accumulator,
                fg.accumulator),
            (fa.value, fb.value, fc.value, fd.value, fe.value, ff.value, fg.value))
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
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>,
        _ fg: Writer<Accumulator, G>,
        _ fh: Writer<Accumulator, H>
    ) -> Writer<Accumulator, (A, B, C, D, E, F, G, H)> where Value == (A, B, C, D, E, F, G, H) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator,
                fc.accumulator,
                fd.accumulator,
                fe.accumulator,
                ff.accumulator,
                fg.accumulator,
                fh.accumulator),
            (fa.value, fb.value, fc.value, fd.value, fe.value, ff.value, fg.value, fh.value))
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
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>,
        _ fg: Writer<Accumulator, G>,
        _ fh: Writer<Accumulator, H>,
        _ fi: Writer<Accumulator, I>
    ) -> Writer<Accumulator, (A, B, C, D, E, F, G, H, I)> where Value == (A, B, C, D, E, F, G, H, I) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator,
                fc.accumulator,
                fd.accumulator,
                fe.accumulator,
                ff.accumulator,
                fg.accumulator,
                fh.accumulator,
                fi.accumulator),
            (fa.value, fb.value, fc.value, fd.value, fe.value, ff.value, fg.value, fh.value, fi.value))
    }
    
    /// Combines the result of two computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
    static func map<A, B>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ f: @escaping (A, B) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B)>.zip(fa, fb).map(f)
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
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ f: @escaping (A, B, C) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B, C)>.zip(fa, fb, fc).map(f)
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
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ f: @escaping (A, B, C, D) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
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
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ f: @escaping (A, B, C, D, E) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
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
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
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
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>,
        _ fg: Writer<Accumulator, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
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
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>,
        _ fg: Writer<Accumulator, G>,
        _ fh: Writer<Accumulator, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
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
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>,
        _ fg: Writer<Accumulator, G>,
        _ fh: Writer<Accumulator, H>,
        _ fi: Writer<Accumulator, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    /// Sequential application.
    ///
    /// - Parameters:
    ///   - fa: A value in the context implementing this instance.
    /// - Returns: A value in this context, resulting from the transformation of the contained original value with the contained function.
    func ap<A, B>(_ fa: Writer<Accumulator, A>) -> Writer<Accumulator, B> where Value == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the first.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result of running the second computation after the first one.
    func zipRight<B>(_ fb: Writer<Accumulator, B>) -> Writer<Accumulator, B> {
        .map(self, fb) { _, b in b }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the second.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result produced from the first computation after both are computed.
    func zipLeft<B>(_ fb: Writer<Accumulator, B>) -> Writer<Accumulator, Value> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
