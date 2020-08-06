public extension Function {
    /// Lifts a value to the this context type.
    ///
    /// - Parameter output: Value to be lifted.
    /// - Returns: Provided value in this context type.
    static func pure(_ output: Output) -> Function<Input, Output> {
        Function(constant(output))
    }
    
    /// Creates a tuple out of two values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>
    ) -> Function<Input, (A, B)> where Output == (A, B) {
        Function { input in
            (fa.invoke(input),
             fb.invoke(input))
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>
    ) -> Function<Input, (A, B, C)> where Output == (A, B, C) {
        Function { input in
            (fa.invoke(input),
             fb.invoke(input),
             fc.invoke(input))
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>
    ) -> Function<Input, (A, B, C, D)> where Output == (A, B, C, D) {
        Function { input in
            (fa.invoke(input),
             fb.invoke(input),
             fc.invoke(input),
             fd.invoke(input))
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>
    ) -> Function<Input, (A, B, C, D, E)> where Output == (A, B, C, D, E) {
        Function { input in
            (fa.invoke(input),
             fb.invoke(input),
             fc.invoke(input),
             fd.invoke(input),
             fe.invoke(input))
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>
    ) -> Function<Input, (A, B, C, D, E, F)> where Output == (A, B, C, D, E, F) {
        Function { input in
            (fa.invoke(input),
             fb.invoke(input),
             fc.invoke(input),
             fd.invoke(input),
             fe.invoke(input),
             ff.invoke(input))
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>,
        _ fg: Function<Input, G>
    ) -> Function<Input, (A, B, C, D, E, F, G)> where Output == (A, B, C, D, E, F, G) {
        Function { input in
            (fa.invoke(input),
             fb.invoke(input),
             fc.invoke(input),
             fd.invoke(input),
             fe.invoke(input),
             ff.invoke(input),
             fg.invoke(input))
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>,
        _ fg: Function<Input, G>,
        _ fh: Function<Input, H>
    ) -> Function<Input, (A, B, C, D, E, F, G, H)> where Output == (A, B, C, D, E, F, G, H) {
        Function { input in
            (fa.invoke(input),
             fb.invoke(input),
             fc.invoke(input),
             fd.invoke(input),
             fe.invoke(input),
             ff.invoke(input),
             fg.invoke(input),
             fh.invoke(input))
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>,
        _ fg: Function<Input, G>,
        _ fh: Function<Input, H>,
        _ fi: Function<Input, I>
    ) -> Function<Input, (A, B, C, D, E, F, G, H, I)> where Output == (A, B, C, D, E, F, G, H, I) {
        Function { input in
            (fa.invoke(input),
             fb.invoke(input),
             fc.invoke(input),
             fd.invoke(input),
             fe.invoke(input),
             ff.invoke(input),
             fg.invoke(input),
             fh.invoke(input),
             fi.invoke(input))
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ f: @escaping (A, B) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B)>.zip(fa, fb).map(f)
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ f: @escaping (A, B, C) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B, C)>.zip(fa, fb, fc).map(f)
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ f: @escaping (A, B, C, D) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ f: @escaping (A, B, C, D, E) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>,
        _ fg: Function<Input, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>,
        _ fg: Function<Input, G>,
        _ fh: Function<Input, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
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
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>,
        _ fg: Function<Input, G>,
        _ fh: Function<Input, H>,
        _ fi: Function<Input, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    /// Sequential application.
    ///
    /// - Parameters:
    ///   - fa: A value in the context implementing this instance.
    /// - Returns: A value in this context, resulting from the transformation of the contained original value with the contained function.
    func ap<A, B>(_ fa: Function<Input, A>) -> Function<Input, B> where Output == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the first.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result of running the second computation after the first one.
    func zipRight<B>(_ fb: Function<Input, B>) -> Function<Input, B> {
        .map(self, fb) { _, b in b }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the second.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result produced from the first computation after both are computed.
    func zipLeft<B>(_ fb: Function<Input, B>) -> Function<Input, Output> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
