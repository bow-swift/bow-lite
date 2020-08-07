public extension Const where Constant: Monoid {
    /// Lifts a value to the this context type.
    ///
    /// - Parameter value: Value to be lifted.
    /// - Returns: Provided value in this context type.
    static func pure(_ value: Variable) -> Const<Constant, Variable> {
        Const(.empty)
    }
    
    /// Creates a tuple out of two values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>
    ) -> Const<Constant, (A, B)> where Variable == (A, B) {
        Const.combineAll(
            fa.retag(),
            fb.retag()
        )
    }
    
    /// Creates a tuple out of three values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    ///   - fc: 3rd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B, C>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>
    ) -> Const<Constant, (A, B, C)> where Variable == (A, B, C) {
        Const.combineAll(
            fa.retag(),
            fb.retag(),
            fc.retag()
        )
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
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>
    ) -> Const<Constant, (A, B, C, D)> where Variable == (A, B, C, D) {
        Const.combineAll(
            fa.retag(),
            fb.retag(),
            fc.retag(),
            fd.retag()
        )
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
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>
    ) -> Const<Constant, (A, B, C, D, E)> where Variable == (A, B, C, D, E) {
        Const.combineAll(
            fa.retag(),
            fb.retag(),
            fc.retag(),
            fd.retag(),
            fe.retag()
        )
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
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>
    ) -> Const<Constant, (A, B, C, D, E, F)> where Variable == (A, B, C, D, E, F) {
        Const.combineAll(
            fa.retag(),
            fb.retag(),
            fc.retag(),
            fd.retag(),
            fe.retag(),
            ff.retag()
        )
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
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>,
        _ fg: Const<Constant, G>
    ) -> Const<Constant, (A, B, C, D, E, F, G)> where Variable == (A, B, C, D, E, F, G) {
        Const.combineAll(
            fa.retag(),
            fb.retag(),
            fc.retag(),
            fd.retag(),
            fe.retag(),
            ff.retag(),
            fg.retag()
        )
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
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>,
        _ fg: Const<Constant, G>,
        _ fh: Const<Constant, H>
    ) -> Const<Constant, (A, B, C, D, E, F, G, H)> where Variable == (A, B, C, D, E, F, G, H) {
        Const.combineAll(
            fa.retag(),
            fb.retag(),
            fc.retag(),
            fd.retag(),
            fe.retag(),
            ff.retag(),
            fg.retag(),
            fh.retag()
        )
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
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>,
        _ fg: Const<Constant, G>,
        _ fh: Const<Constant, H>,
        _ fi: Const<Constant, I>
    ) -> Const<Constant, (A, B, C, D, E, F, G, H, I)> where Variable == (A, B, C, D, E, F, G, H, I) {
        Const.combineAll(
            fa.retag(),
            fb.retag(),
            fc.retag(),
            fd.retag(),
            fe.retag(),
            ff.retag(),
            fg.retag(),
            fh.retag(),
            fi.retag()
        )
    }
    
    /// Combines the result of two computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
    static func map<A, B>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ f: @escaping (A, B) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B)>.zip(fa, fb).map(f)
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
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ f: @escaping (A, B, C) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B, C)>.zip(fa, fb, fc).map(f)
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
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ f: @escaping (A, B, C, D) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
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
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ f: @escaping (A, B, C, D, E) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
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
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
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
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>,
        _ fg: Const<Constant, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
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
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>,
        _ fg: Const<Constant, G>,
        _ fh: Const<Constant, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
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
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>,
        _ fg: Const<Constant, G>,
        _ fh: Const<Constant, H>,
        _ fi: Const<Constant, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    /// Sequential application.
    ///
    /// - Parameters:
    ///   - fa: A value in the context implementing this instance.
    /// - Returns: A value in this context, resulting from the transformation of the contained original value with the contained function.
    func ap<A, B>(_ fa: Const<Constant, A>) -> Const<Constant, B> where Variable == (A) -> B {
        self.retag().combine(fa.retag())
    }
    
    /// Sequentially compose two computations, discarding the value produced by the first.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result of running the second computation after the first one.
    func zipRight<B>(_ fb: Const<Constant, B>) -> Const<Constant, B> {
        .map(self, fb) { _, b in b }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the second.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result produced from the first computation after both are computed.
    func zipLeft<B>(_ fb: Const<Constant, B>) -> Const<Constant, Variable> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
