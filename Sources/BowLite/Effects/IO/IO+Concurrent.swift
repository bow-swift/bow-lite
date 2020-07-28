public extension IO {
    /// Runs 2 computations in parallel and tuples their results.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    /// - Returns: A computation that describes the parallel execution.
    static func parZip<A, B>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>
    ) -> IO<Failure, Success> where Success == (A, B) {
        Self.parMap(fa, fb) { a, b in (a, b) }
    }
    
    /// Runs 3 computations in parallel and tuples their results.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    /// - Returns: A computation that describes the parallel execution.
    static func parZip<A, B, C>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>
    ) -> IO<Failure, Success> where Success == (A, B, C) {
        Self.parMap(fa, fb, fc) { a, b, c in (a, b, c) }
    }
    
    /// Runs 4 computations in parallel and tuples their results.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    /// - Returns: A computation that describes the parallel execution.
    static func parZip<A, B, C, D>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>
    ) -> IO<Failure, Success> where Success == (A, B, C, D) {
        Self.parMap(fa, fb, fc, fd) { a, b, c, d in (a, b, c, d) }
    }
    
    /// Runs 5 computations in parallel and tuples their results.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    /// - Returns: A computation that describes the parallel execution.
    static func parZip<A, B, C, D, E>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>
    ) -> IO<Failure, Success> where Success == (A, B, C, D, E) {
        Self.parMap(fa, fb, fc, fd, fe) { a, b, c, d, e in (a, b, c, d, e) }
    }
    
    /// Runs 6 computations in parallel and tuples their results.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    ///   - ff: 6th computation.
    /// - Returns: A computation that describes the parallel execution.
    static func parZip<A, B, C, D, E, F>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ ff: IO<Failure, F>
    ) -> IO<Failure, Success> where Success == (A, B, C, D, E, F) {
        Self.parMap(fa, fb, fc, fd, fe, ff) { a, b, c, d, e, f in (a, b, c, d, e, f) }
    }
    
    /// Runs 7 computations in parallel and tuples their results.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    ///   - ff: 6th computation.
    ///   - fg: 7th computation.
    /// - Returns: A computation that describes the parallel execution.
    static func parZip<A, B, C, D, E, F, G>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ ff: IO<Failure, F>,
        _ fg: IO<Failure, G>
    ) -> IO<Failure, Success> where Success == (A, B, C, D, E, F, G) {
        Self.parMap(fa, fb, fc, fd, fe, ff, fg) { a, b, c, d, e, f, g in (a, b, c, d, e, f, g) }
    }
    
    /// Runs 8 computations in parallel and tuples their results.
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
    /// - Returns: A computation that describes the parallel execution.
    static func parZip<A, B, C, D, E, F, G, H>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ ff: IO<Failure, F>,
        _ fg: IO<Failure, G>,
        _ fh: IO<Failure, H>
    ) -> IO<Failure, Success> where Success == (A, B, C, D, E, F, G, H) {
        Self.parMap(fa, fb, fc, fd, fe, ff, fg, fh) { a, b, c, d, e, f, g, h in (a, b, c, d, e, f, g, h) }
    }
    
    /// Runs 9 computations in parallel and tuples their results.
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
    /// - Returns: A computation that describes the parallel execution.
    static func parZip<A, B, C, D, E, F, G, H, I>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ ff: IO<Failure, F>,
        _ fg: IO<Failure, G>,
        _ fh: IO<Failure, H>,
        _ fi: IO<Failure, I>
    ) -> IO<Failure, Success> where Success == (A, B, C, D, E, F, G, H, I) {
        Self.parMap(fa, fb, fc, fd, fe, ff, fg, fh, fi) { a, b, c, d, e, f, g, h, i in (a, b, c, d, e, f, g, h, i) }
    }
    
    /// Runs 4 computations in parallel and combines their results using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - f: Combination function.
    /// - Returns: A computation that describes the parallel execution.
    static func parMap<A, B, C, D>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ f: @escaping (A, B, C, D) -> Success
    ) -> IO<Failure, Success> {
        parMap(
            IO<Failure, (A, B)>.parZip(fa, fb),
            IO<Failure, (C, D)>.parZip(fc, fd)
        ) { x, y in f(x.0, x.1, y.0, y.1) }
    }
    
    /// Runs 5 computations in parallel and combines their results using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    ///   - f: Combination function.
    /// - Returns: A computation that describes the parallel execution.
    static func parMap<A, B, C, D, E>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ f: @escaping (A, B, C, D, E) -> Success
    ) -> IO<Failure, Success> {
        parMap(
            IO<Failure, (A, B, C)>.parZip(fa, fb, fc),
            IO<Failure, (D, E)>.parZip(fd, fe)
        ) { x, y in f(x.0, x.1, x.2, y.0, y.1) }
    }
    
    /// Runs 6 computations in parallel and combines their results using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    ///   - ff: 6th computation.
    ///   - f: Combination function.
    /// - Returns: A computation that describes the parallel execution.
    static func parMap<A, B, C, D, E, F>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ ff: IO<Failure, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Success
    ) -> IO<Failure, Success> {
        parMap(
            IO<Failure, (A, B, C)>.parZip(fa, fb, fc),
            IO<Failure, (D, E, F)>.parZip(fd, fe, ff)
        ) { x, y in f(x.0, x.1, x.2, y.0, y.1, y.2) }
    }
    
    /// Runs 7 computations in parallel and combines their results using the provided function.
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
    /// - Returns: A computation that describes the parallel execution.
    static func parMap<A, B, C, D, E, F, G>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ ff: IO<Failure, F>,
        _ fg: IO<Failure, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Success
    ) -> IO<Failure, Success> {
        parMap(
            IO<Failure, (A, B, C)>.parZip(fa, fb, fc),
            IO<Failure, (D, E)>.parZip(fd, fe),
            IO<Failure, (F, G)>.parZip(ff, fg)
        ) { x, y, z in f(x.0, x.1, x.2, y.0, y.1, z.0, z.1) }
    }
    
    /// Runs 8 computations in parallel and combines their results using the provided function.
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
    /// - Returns: A computation that describes the parallel execution.
    static func parMap<A, B, C, D, E, F, G, H>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ ff: IO<Failure, F>,
        _ fg: IO<Failure, G>,
        _ fh: IO<Failure, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Success
    ) -> IO<Failure, Success> {
        parMap(
            IO<Failure, (A, B, C)>.parZip(fa, fb, fc),
            IO<Failure, (D, E, F)>.parZip(fd, fe, ff),
            IO<Failure, (G, H)>.parZip(fg, fh)
        ) { x, y, z in f(x.0, x.1, x.2, y.0, y.1, y.2, z.0, z.1) }
    }
    
    /// Runs 9 computations in parallel and combines their results using the provided function.
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
    /// - Returns: A computation that describes the parallel execution.
    static func parMap<A, B, C, D, E, F, G, H, I>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ ff: IO<Failure, F>,
        _ fg: IO<Failure, G>,
        _ fh: IO<Failure, H>,
        _ fi: IO<Failure, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Success
    ) -> IO<Failure, Success> {
        parMap(
            IO<Failure, (A, B, C)>.parZip(fa, fb, fc),
            IO<Failure, (D, E, F)>.parZip(fd, fe, ff),
            IO<Failure, (G, H, I)>.parZip(fg, fh, fi)
        ) { x, y, z in f(x.0, x.1, x.2, y.0, y.1, y.2, z.0, z.1, z.2) }
    }
}
