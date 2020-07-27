public extension Validated where Invalid: Semigroup {
    /// Lifts a value to the this context type.
    ///
    /// - Parameter wrapped: Value to be lifted.
    /// - Returns: Provided value in this context type.
    static func pure(_ valid: Valid) -> Validated<Invalid, Valid> {
        .valid(valid)
    }
    
    /// Creates a tuple out of two values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>
    ) -> Validated<Invalid, (A, B)> where Valid == (A, B) {
        switch (fa, fb) {
            
        case (.valid(let a), .valid(let b)):
            return .valid((a, b))
            
        case (.invalid(let e1), .invalid(let e2)):
            return .invalid(e1.combine(e2))
            
        case (.invalid(let l), _),
             (_, .invalid(let l)):
            return .invalid(l)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>
    ) -> Validated<Invalid, (A, B, C)> where Valid == (A, B, C) {
        map(Validated<Invalid, (A, B)>.zip(fa, fb), fc) { x, y in
            (x.0, x.1, y)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>
    ) -> Validated<Invalid, (A, B, C, D)> where Valid == (A, B, C, D) {
        map(Validated<Invalid, (A, B, C)>.zip(fa, fb, fc), fd) { x, y in
            (x.0, x.1, x.2, y)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>
    ) -> Validated<Invalid, (A, B, C, D, E)> where Valid == (A, B, C, D, E) {
        map(Validated<Invalid, (A, B, C, D)>.zip(fa, fb, fc, fd), fe) { x, y in
            (x.0, x.1, x.2, x.3, y)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>
    ) -> Validated<Invalid, (A, B, C, D, E, F)> where Valid == (A, B, C, D, E, F) {
        map(Validated<Invalid, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe), ff) { x, y in
            (x.0, x.1, x.2, x.3, x.4, y)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>,
        _ fg: Validated<Invalid, G>
    ) -> Validated<Invalid, (A, B, C, D, E, F, G)> where Valid == (A, B, C, D, E, F, G) {
        map(Validated<Invalid, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff), fg) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, y)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>,
        _ fg: Validated<Invalid, G>,
        _ fh: Validated<Invalid, H>
    ) -> Validated<Invalid, (A, B, C, D, E, F, G, H)> where Valid == (A, B, C, D, E, F, G, H) {
        map(Validated<Invalid, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg), fh) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, x.6, y)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>,
        _ fg: Validated<Invalid, G>,
        _ fh: Validated<Invalid, H>,
        _ fi: Validated<Invalid, I>
    ) -> Validated<Invalid, (A, B, C, D, E, F, G, H, I)> where Valid == (A, B, C, D, E, F, G, H, I) {
        map(Validated<Invalid, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh), fi) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, x.6, x.7, y)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ f: @escaping (A, B) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B)>.zip(fa, fb).map(f)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ f: @escaping (A, B, C) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B, C)>.zip(fa, fb, fc).map(f)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ f: @escaping (A, B, C, D) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ f: @escaping (A, B, C, D, E) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>,
        _ fg: Validated<Invalid, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>,
        _ fg: Validated<Invalid, G>,
        _ fh: Validated<Invalid, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
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
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>,
        _ fg: Validated<Invalid, G>,
        _ fh: Validated<Invalid, H>,
        _ fi: Validated<Invalid, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    /// Sequential application.
    ///
    /// - Parameters:
    ///   - fa: A value in the context implementing this instance.
    /// - Returns: A value in this context, resulting from the transformation of the contained original value with the contained function.
    func ap<A, B>(_ fa: Validated<Invalid, A>) -> Validated<Invalid, B> where Valid == (A) -> B {
        switch (self, fa) {
        case (.valid(let f), .valid(let a)):
            return .valid(f(a))
        case (.invalid(let e1), .invalid(let e2)):
            return .invalid(e1.combine(e2))
        case (.invalid(let e), _), (_, .invalid(let e)):
            return .invalid(e)
        }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the first.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result of running the second computation after the first one.
    func zipRight<B>(_ fb: Validated<Invalid, B>) -> Validated<Invalid, B> {
        .map(self, fb) { _, b in b }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the second.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result produced from the first computation after both are computed.
    func zipLeft<B>(_ fb: Validated<Invalid, B>) -> Validated<Invalid, Valid> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
