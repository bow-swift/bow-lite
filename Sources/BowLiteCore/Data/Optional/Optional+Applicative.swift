public extension Optional {
    /// Lifts a value to the this context type.
    ///
    /// - Parameter wrapped: Value to be lifted.
    /// - Returns: Provided value in this context type.
    static func pure(_ wrapped: Wrapped) -> Wrapped? {
        wrapped
    }
    
    /// Creates a tuple out of two values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B>(
        _ fa: A?,
        _ fb: B?
    ) -> (A, B)? where Wrapped == (A, B) {
        if let a = fa, let b = fb {
            return (a, b)
        } else {
            return nil
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
        _ fa: A?,
        _ fb: B?,
        _ fc: C?
    ) -> (A, B, C)? where Wrapped == (A, B, C) {
        if let a = fa, let b = fb, let c = fc {
            return (a, b, c)
        } else {
            return nil
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
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ fd: D?
    ) -> (A, B, C, D)? where Wrapped == (A, B, C, D) {
        if let a = fa, let b = fb, let c = fc, let d = fd {
            return (a, b, c, d)
        } else {
            return nil
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
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ fd: D?,
        _ fe: E?
    ) -> (A, B, C, D, E)? where Wrapped == (A, B, C, D, E) {
        if let a = fa, let b = fb, let c = fc, let d = fd, let e = fe {
            return (a, b, c, d, e)
        } else {
            return nil
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
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ fd: D?,
        _ fe: E?,
        _ ff: F?
    ) -> (A, B, C, D, E, F)? where Wrapped == (A, B, C, D, E, F) {
        if let a = fa, let b = fb, let c = fc, let d = fd, let e = fe, let f = ff {
            return (a, b, c, d, e, f)
        } else {
            return nil
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
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ fd: D?,
        _ fe: E?,
        _ ff: F?,
        _ fg: G?
    ) -> (A, B, C, D, E, F, G)? where Wrapped == (A, B, C, D, E, F, G) {
        if let a = fa, let b = fb, let c = fc, let d = fd, let e = fe, let f = ff, let g = fg {
            return (a, b, c, d, e, f, g)
        } else {
            return nil
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
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ fd: D?,
        _ fe: E?,
        _ ff: F?,
        _ fg: G?,
        _ fh: H?
    ) -> (A, B, C, D, E, F, G, H)? where Wrapped == (A, B, C, D, E, F, G, H) {
        if let a = fa, let b = fb, let c = fc, let d = fd, let e = fe, let f = ff, let g = fg, let h = fh {
            return (a, b, c, d, e, f, g, h)
        } else {
            return nil
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
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ fd: D?,
        _ fe: E?,
        _ ff: F?,
        _ fg: G?,
        _ fh: H?,
        _ fi: I?
    ) -> (A, B, C, D, E, F, G, H, I)? where Wrapped == (A, B, C, D, E, F, G, H, I) {
        if let a = fa, let b = fb, let c = fc, let d = fd, let e = fe, let f = ff, let g = fg, let h = fh, let i = fi {
            return (a, b, c, d, e, f, g, h, i)
        } else {
            return nil
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
        _ fa: A?,
        _ fb: B?,
        _ f: @escaping (A, B) -> Wrapped
    ) -> Wrapped? {
        Optional<(A, B)>.zip(fa, fb).map(f)
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
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ f: @escaping (A, B, C) -> Wrapped
    ) -> Wrapped? {
        Optional<(A, B, C)>.zip(fa, fb, fc).map(f)
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
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ fd: D?,
        _ f: @escaping (A, B, C, D) -> Wrapped
    ) -> Wrapped? {
        Optional<(A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
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
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ fd: D?,
        _ fe: E?,
        _ f: @escaping (A, B, C, D, E) -> Wrapped
    ) -> Wrapped? {
        Optional<(A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
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
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ fd: D?,
        _ fe: E?,
        _ ff: F?,
        _ f: @escaping (A, B, C, D, E, F) -> Wrapped
    ) -> Wrapped? {
        Optional<(A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
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
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ fd: D?,
        _ fe: E?,
        _ ff: F?,
        _ fg: G?,
        _ f: @escaping (A, B, C, D, E, F, G) -> Wrapped
    ) -> Wrapped? {
        Optional<(A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
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
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ fd: D?,
        _ fe: E?,
        _ ff: F?,
        _ fg: G?,
        _ fh: H?,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Wrapped
    ) -> Wrapped? {
        Optional<(A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
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
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ fd: D?,
        _ fe: E?,
        _ ff: F?,
        _ fg: G?,
        _ fh: H?,
        _ fi: I?,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Wrapped
    ) -> Wrapped? {
        Optional<(A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    /// Sequential application.
    ///
    /// - Parameters:
    ///   - fa: A value in the context implementing this instance.
    /// - Returns: A value in this context, resulting from the transformation of the contained original value with the contained function.
    func ap<A, B>(_ fa: A?) -> B? where Wrapped == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the first.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result of running the second computation after the first one.
    func zipRight<B>(_ fb: B?) -> B? {
        .map(self, fb) { _, b in b }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the second.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result produced from the first computation after both are computed.
    func zipLeft<B>(_ fb: B?) -> Wrapped? {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
