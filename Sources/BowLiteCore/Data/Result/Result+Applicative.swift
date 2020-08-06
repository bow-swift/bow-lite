public extension Result {
    /// Lifts a value to the this context type.
    ///
    /// - Parameter wrapped: Value to be lifted.
    /// - Returns: Provided value in this context type.
    static func pure(_ wrapped: Success) -> Result<Success, Failure> {
        .success(wrapped)
    }
    
    /// Creates a tuple out of two values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>
    ) -> Result<(A, B), Failure> where Success == (A, B) {
        switch (fa, fb) {
            
        case (.success(let a), .success(let b)):
            return .success((a, b))
            
        case (.failure(let l), _),
             (_, .failure(let l)):
            return .failure(l)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>
    ) -> Result<(A, B, C), Failure> where Success == (A, B, C) {
        switch (fa, fb, fc) {
            
        case (.success(let a), .success(let b), .success(let c)):
            return .success((a, b, c))
            
        case (.failure(let l), _, _),
             (_, .failure(let l), _),
             (_, _, .failure(let l)):
            return .failure(l)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>
    ) -> Result<(A, B, C, D), Failure> where Success == (A, B, C, D) {
        switch (fa, fb, fc, fd) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d)):
            return .success((a, b, c, d))
            
        case (.failure(let l), _, _, _),
             (_, .failure(let l), _, _),
             (_, _, .failure(let l), _),
             (_, _, _, .failure(let l)):
            return .failure(l)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>
    ) -> Result<(A, B, C, D, E), Failure> where Success == (A, B, C, D, E) {
        switch (fa, fb, fc, fd, fe) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e)):
            return .success((a, b, c, d, e))
            
        case (.failure(let l), _, _, _, _),
             (_, .failure(let l), _, _, _),
             (_, _, .failure(let l), _, _),
             (_, _, _, .failure(let l), _),
             (_, _, _, _, .failure(let l)):
            return .failure(l)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>
    ) -> Result<(A, B, C, D, E, F), Failure> where Success == (A, B, C, D, E, F) {
        switch (fa, fb, fc, fd, fe, ff) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e), .success(let f)):
            return .success((a, b, c, d, e, f))
            
        case (.failure(let l), _, _, _, _, _),
             (_, .failure(let l), _, _, _, _),
             (_, _, .failure(let l), _, _, _),
             (_, _, _, .failure(let l), _, _),
             (_, _, _, _, .failure(let l), _),
             (_, _, _, _, _, .failure(let l)):
            return .failure(l)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>,
        _ fg: Result<G, Failure>
    ) -> Result<(A, B, C, D, E, F, G), Failure> where Success == (A, B, C, D, E, F, G) {
        switch (fa, fb, fc, fd, fe, ff, fg) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e), .success(let f), .success(let g)):
            return .success((a, b, c, d, e, f, g))
            
        case (.failure(let l), _, _, _, _, _, _),
             (_, .failure(let l), _, _, _, _, _),
             (_, _, .failure(let l), _, _, _, _),
             (_, _, _, .failure(let l), _, _, _),
             (_, _, _, _, .failure(let l), _, _),
             (_, _, _, _, _, .failure(let l), _),
             (_, _, _, _, _, _, .failure(let l)):
            return .failure(l)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>,
        _ fg: Result<G, Failure>,
        _ fh: Result<H, Failure>
    ) -> Result<(A, B, C, D, E, F, G, H), Failure> where Success == (A, B, C, D, E, F, G, H) {
        switch (fa, fb, fc, fd, fe, ff, fg, fh) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e), .success(let f), .success(let g), .success(let h)):
            return .success((a, b, c, d, e, f, g, h))
            
        case (.failure(let l), _, _, _, _, _, _, _),
             (_, .failure(let l), _, _, _, _, _, _),
             (_, _, .failure(let l), _, _, _, _, _),
             (_, _, _, .failure(let l), _, _, _, _),
             (_, _, _, _, .failure(let l), _, _, _),
             (_, _, _, _, _, .failure(let l), _, _),
             (_, _, _, _, _, _, .failure(let l), _),
             (_, _, _, _, _, _, _, .failure(let l)):
            return .failure(l)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>,
        _ fg: Result<G, Failure>,
        _ fh: Result<H, Failure>,
        _ fi: Result<I, Failure>
    ) -> Result<(A, B, C, D, E, F, G, H, I), Failure> where Success == (A, B, C, D, E, F, G, H, I) {
        switch (fa, fb, fc, fd, fe, ff, fg, fh, fi) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e), .success(let f), .success(let g), .success(let h), .success(let i)):
            return .success((a, b, c, d, e, f, g, h, i))
            
        case (.failure(let l), _, _, _, _, _, _, _, _),
             (_, .failure(let l), _, _, _, _, _, _, _),
             (_, _, .failure(let l), _, _, _, _, _, _),
             (_, _, _, .failure(let l), _, _, _, _, _),
             (_, _, _, _, .failure(let l), _, _, _, _),
             (_, _, _, _, _, .failure(let l), _, _, _),
             (_, _, _, _, _, _, .failure(let l), _, _),
             (_, _, _, _, _, _, _, .failure(let l), _),
             (_, _, _, _, _, _, _, _, .failure(let l)):
            return .failure(l)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ f: @escaping (A, B) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B), Failure>.zip(fa, fb).map(f)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ f: @escaping (A, B, C) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B, C), Failure>.zip(fa, fb, fc).map(f)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ f: @escaping (A, B, C, D) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B, C, D), Failure>.zip(fa, fb, fc, fd).map(f)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ f: @escaping (A, B, C, D, E) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B, C, D, E), Failure>.zip(fa, fb, fc, fd, fe).map(f)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>,
        _ f: @escaping (A, B, C, D, E, F) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B, C, D, E, F), Failure>.zip(fa, fb, fc, fd, fe, ff).map(f)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>,
        _ fg: Result<G, Failure>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B, C, D, E, F, G), Failure>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>,
        _ fg: Result<G, Failure>,
        _ fh: Result<H, Failure>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B, C, D, E, F, G, H), Failure>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
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
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>,
        _ fg: Result<G, Failure>,
        _ fh: Result<H, Failure>,
        _ fi: Result<I, Failure>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B, C, D, E, F, G, H, I), Failure>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    /// Sequential application.
    ///
    /// - Parameters:
    ///   - fa: A value in the context implementing this instance.
    /// - Returns: A value in this context, resulting from the transformation of the contained original value with the contained function.
    func ap<A, B>(_ fa: Result<A, Failure>) -> Result<B, Failure> where Success == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the first.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result of running the second computation after the first one.
    func zipRight<B>(_ fb: Result<B, Failure>) -> Result<B, Failure> {
        .map(self, fb) { _, b in b }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the second.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result produced from the first computation after both are computed.
    func zipLeft<B>(_ fb: Result<B, Failure>) -> Result<Success, Failure> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
