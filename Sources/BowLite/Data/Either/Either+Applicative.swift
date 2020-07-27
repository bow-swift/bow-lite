public extension Either {
    /// Lifts a value to the this context type.
    ///
    /// - Parameter wrapped: Value to be lifted.
    /// - Returns: Provided value in this context type.
    static func pure(_ wrapped: Right) -> Either<Left, Right> {
        .right(wrapped)
    }
    
    /// Creates a tuple out of two values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>
    ) -> Either<Left, (A, B)> where Right == (A, B) {
        switch (fa, fb) {
            
        case (.right(let a), .right(let b)):
            return .right((a, b))
            
        case (.left(let l), _),
             (_, .left(let l)):
            return .left(l)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>
    ) -> Either<Left, (A, B, C)> where Right == (A, B, C) {
        switch (fa, fb, fc) {
            
        case (.right(let a), .right(let b), .right(let c)):
            return .right((a, b, c))
            
        case (.left(let l), _, _),
             (_, .left(let l), _),
             (_, _, .left(let l)):
            return .left(l)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>
    ) -> Either<Left, (A, B, C, D)> where Right == (A, B, C, D) {
        switch (fa, fb, fc, fd) {
            
        case (.right(let a), .right(let b), .right(let c), .right(let d)):
            return .right((a, b, c, d))
            
        case (.left(let l), _, _, _),
             (_, .left(let l), _, _),
             (_, _, .left(let l), _),
             (_, _, _, .left(let l)):
            return .left(l)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>
    ) -> Either<Left, (A, B, C, D, E)> where Right == (A, B, C, D, E) {
        switch (fa, fb, fc, fd, fe) {
            
        case (.right(let a), .right(let b), .right(let c), .right(let d), .right(let e)):
            return .right((a, b, c, d, e))
            
        case (.left(let l), _, _, _, _),
             (_, .left(let l), _, _, _),
             (_, _, .left(let l), _, _),
             (_, _, _, .left(let l), _),
             (_, _, _, _, .left(let l)):
            return .left(l)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>
    ) -> Either<Left, (A, B, C, D, E, F)> where Right == (A, B, C, D, E, F) {
        switch (fa, fb, fc, fd, fe, ff) {
            
        case (.right(let a), .right(let b), .right(let c), .right(let d), .right(let e), .right(let f)):
            return .right((a, b, c, d, e, f))
            
        case (.left(let l), _, _, _, _, _),
             (_, .left(let l), _, _, _, _),
             (_, _, .left(let l), _, _, _),
             (_, _, _, .left(let l), _, _),
             (_, _, _, _, .left(let l), _),
             (_, _, _, _, _, .left(let l)):
            return .left(l)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>,
        _ fg: Either<Left, G>
    ) -> Either<Left, (A, B, C, D, E, F, G)> where Right == (A, B, C, D, E, F, G) {
        switch (fa, fb, fc, fd, fe, ff, fg) {
            
        case (.right(let a), .right(let b), .right(let c), .right(let d), .right(let e), .right(let f), .right(let g)):
            return .right((a, b, c, d, e, f, g))
            
        case (.left(let l), _, _, _, _, _, _),
             (_, .left(let l), _, _, _, _, _),
             (_, _, .left(let l), _, _, _, _),
             (_, _, _, .left(let l), _, _, _),
             (_, _, _, _, .left(let l), _, _),
             (_, _, _, _, _, .left(let l), _),
             (_, _, _, _, _, _, .left(let l)):
            return .left(l)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>,
        _ fg: Either<Left, G>,
        _ fh: Either<Left, H>
    ) -> Either<Left, (A, B, C, D, E, F, G, H)> where Right == (A, B, C, D, E, F, G, H) {
        switch (fa, fb, fc, fd, fe, ff, fg, fh) {
            
        case (.right(let a), .right(let b), .right(let c), .right(let d), .right(let e), .right(let f), .right(let g), .right(let h)):
            return .right((a, b, c, d, e, f, g, h))
            
        case (.left(let l), _, _, _, _, _, _, _),
             (_, .left(let l), _, _, _, _, _, _),
             (_, _, .left(let l), _, _, _, _, _),
             (_, _, _, .left(let l), _, _, _, _),
             (_, _, _, _, .left(let l), _, _, _),
             (_, _, _, _, _, .left(let l), _, _),
             (_, _, _, _, _, _, .left(let l), _),
             (_, _, _, _, _, _, _, .left(let l)):
            return .left(l)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>,
        _ fg: Either<Left, G>,
        _ fh: Either<Left, H>,
        _ fi: Either<Left, I>
    ) -> Either<Left, (A, B, C, D, E, F, G, H, I)> where Right == (A, B, C, D, E, F, G, H, I) {
        switch (fa, fb, fc, fd, fe, ff, fg, fh, fi) {
            
        case (.right(let a), .right(let b), .right(let c), .right(let d), .right(let e), .right(let f), .right(let g), .right(let h), .right(let i)):
            return .right((a, b, c, d, e, f, g, h, i))
            
        case (.left(let l), _, _, _, _, _, _, _, _),
             (_, .left(let l), _, _, _, _, _, _, _),
             (_, _, .left(let l), _, _, _, _, _, _),
             (_, _, _, .left(let l), _, _, _, _, _),
             (_, _, _, _, .left(let l), _, _, _, _),
             (_, _, _, _, _, .left(let l), _, _, _),
             (_, _, _, _, _, _, .left(let l), _, _),
             (_, _, _, _, _, _, _, .left(let l), _),
             (_, _, _, _, _, _, _, _, .left(let l)):
            return .left(l)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ f: @escaping (A, B) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B)>.zip(fa, fb).map(f)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ f: @escaping (A, B, C) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B, C)>.zip(fa, fb, fc).map(f)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ f: @escaping (A, B, C, D) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ f: @escaping (A, B, C, D, E) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>,
        _ fg: Either<Left, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>,
        _ fg: Either<Left, G>,
        _ fh: Either<Left, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
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
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>,
        _ fg: Either<Left, G>,
        _ fh: Either<Left, H>,
        _ fi: Either<Left, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    /// Sequential application.
    ///
    /// - Parameters:
    ///   - fa: A value in the context implementing this instance.
    /// - Returns: A value in this context, resulting from the transformation of the contained original value with the contained function.
    func ap<A, B>(_ fa: Either<Left, A>) -> Either<Left, B> where Right == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the first.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result of running the second computation after the first one.
    func zipRight<B>(_ fb: Either<Left, B>) -> Either<Left, B> {
        .map(self, fb) { _, b in b }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the second.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result produced from the first computation after both are computed.
    func zipLeft<B>(_ fb: Either<Left, B>) -> Either<Left, Right> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
