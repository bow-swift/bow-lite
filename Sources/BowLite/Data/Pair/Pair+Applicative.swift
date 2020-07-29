public extension Pair where First: Monoid {
    /// Lifts a value to the this context type.
    ///
    /// - Parameter wrapped: Value to be lifted.
    /// - Returns: Provided value in this context type.
    static func pure(_ wrapped: Second) -> Pair<First, Second> {
        Pair(.empty, wrapped)
    }
    
    /// Creates a tuple out of two values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B>(
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>
    ) -> Pair<First, (A, B)> where Second == (A, B) {
        fa.flatMap { a in
            fb.map { b in (a, b) }
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
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ fc: Pair<First, C>
    ) -> Pair<First, (A, B, C)> where Second == (A, B, C) {
        fa.flatMap { a in
            fb.flatMap { b in
                fc.map { c in (a, b, c) }
            }
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
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ fc: Pair<First, C>,
        _ fd: Pair<First, D>
    ) -> Pair<First, (A, B, C, D)> where Second == (A, B, C, D) {
        fa.flatMap { a in
            fb.flatMap { b in
                fc.flatMap { c in
                    fd.map { d in (a, b, c, d) }
                }
            }
        }
    }
    
    /// Creates a tuple out of five values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    ///   - fc: 3rd value of the tuple.
    ///   - fd: 4th value of the tuple.
    ///   - fe: 5th value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B, C, D, E>(
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ fc: Pair<First, C>,
        _ fd: Pair<First, D>,
        _ fe: Pair<First, E>
    ) -> Pair<First, (A, B, C, D, E)> where Second == (A, B, C, D, E) {
        fa.flatMap { a in
            fb.flatMap { b in
                fc.flatMap { c in
                    fd.flatMap { d in
                        fe.map { e in (a, b, c, d, e) }
                    }
                }
            }
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
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ fc: Pair<First, C>,
        _ fd: Pair<First, D>,
        _ fe: Pair<First, E>,
        _ ff: Pair<First, F>
    ) -> Pair<First, (A, B, C, D, E, F)> where Second == (A, B, C, D, E, F) {
        fa.flatMap { a in
            fb.flatMap { b in
                fc.flatMap { c in
                    fd.flatMap { d in
                        fe.flatMap { e in
                            ff.map { f in (a, b, c, d, e, f) }
                        }
                    }
                }
            }
        }
    }
    
    /// Creates a tuple out of seven values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    ///   - fc: 3rd value of the tuple.
    ///   - fd: 4th value of the tuple.
    ///   - fe: 5th value of the tuple.
    ///   - ff: 6th value of the tuple.
    ///   - fg: 7th value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B, C, D, E, F, G>(
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ fc: Pair<First, C>,
        _ fd: Pair<First, D>,
        _ fe: Pair<First, E>,
        _ ff: Pair<First, F>,
        _ fg: Pair<First, G>
    ) -> Pair<First, (A, B, C, D, E, F, G)> where Second == (A, B, C, D, E, F, G) {
        fa.flatMap { a in
            fb.flatMap { b in
                fc.flatMap { c in
                    fd.flatMap { d in
                        fe.flatMap { e in
                            ff.flatMap { f in
                                fg.map { g in (a, b, c, d, e, f, g) }
                            }
                        }
                    }
                }
            }
        }
    }
    
    /// Creates a tuple out of eight values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    ///   - fc: 3rd value of the tuple.
    ///   - fd: 4th value of the tuple.
    ///   - fe: 5th value of the tuple.
    ///   - ff: 6th value of the tuple.
    ///   - fg: 7th value of the tuple.
    ///   - fh: 8th value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B, C, D, E, F, G, H>(
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ fc: Pair<First, C>,
        _ fd: Pair<First, D>,
        _ fe: Pair<First, E>,
        _ ff: Pair<First, F>,
        _ fg: Pair<First, G>,
        _ fh: Pair<First, H>
    ) -> Pair<First, (A, B, C, D, E, F, G, H)> where Second == (A, B, C, D, E, F, G, H) {
        fa.flatMap { a in
            fb.flatMap { b in
                fc.flatMap { c in
                    fd.flatMap { d in
                        fe.flatMap { e in
                            ff.flatMap { f in
                                fg.flatMap { g in
                                    fh.map { h in (a, b, c, d, e, f, g, h) }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    /// Creates a tuple out of nine values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    ///   - fc: 3rd value of the tuple.
    ///   - fd: 4th value of the tuple.
    ///   - fe: 5th value of the tuple.
    ///   - ff: 6th value of the tuple.
    ///   - fg: 7th value of the tuple.
    ///   - fh: 8th value of the tuple.
    ///   - fi: 9th value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B, C, D, E, F, G, H, I>(
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ fc: Pair<First, C>,
        _ fd: Pair<First, D>,
        _ fe: Pair<First, E>,
        _ ff: Pair<First, F>,
        _ fg: Pair<First, G>,
        _ fh: Pair<First, H>,
        _ fi: Pair<First, I>
    ) -> Pair<First, (A, B, C, D, E, F, G, H, I)> where Second == (A, B, C, D, E, F, G, H, I) {
        fa.flatMap { a in
            fb.flatMap { b in
                fc.flatMap { c in
                    fd.flatMap { d in
                        fe.flatMap { e in
                            ff.flatMap { f in
                                fg.flatMap { g in
                                    fh.flatMap { h in
                                        fi.map { i in (a, b, c, d, e, f, g, h, i) }
                                    }
                                }
                            }
                        }
                    }
                }
            }
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
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ f: @escaping (A, B) -> Second
    ) -> Pair<First, Second> {
        Pair<First, (A, B)>.zip(fa, fb).map(f)
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
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ fc: Pair<First, C>,
        _ f: @escaping (A, B, C) -> Second
    ) -> Pair<First, Second> {
        Pair<First, (A, B, C)>.zip(fa, fb, fc).map(f)
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
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ fc: Pair<First, C>,
        _ fd: Pair<First, D>,
        _ f: @escaping (A, B, C, D) -> Second
    ) -> Pair<First, Second> {
        Pair<First, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
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
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ fc: Pair<First, C>,
        _ fd: Pair<First, D>,
        _ fe: Pair<First, E>,
        _ f: @escaping (A, B, C, D, E) -> Second
    ) -> Pair<First, Second> {
        Pair<First, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
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
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ fc: Pair<First, C>,
        _ fd: Pair<First, D>,
        _ fe: Pair<First, E>,
        _ ff: Pair<First, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Second
    ) -> Pair<First, Second> {
        Pair<First, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
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
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ fc: Pair<First, C>,
        _ fd: Pair<First, D>,
        _ fe: Pair<First, E>,
        _ ff: Pair<First, F>,
        _ fg: Pair<First, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Second
    ) -> Pair<First, Second> {
        Pair<First, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
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
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ fc: Pair<First, C>,
        _ fd: Pair<First, D>,
        _ fe: Pair<First, E>,
        _ ff: Pair<First, F>,
        _ fg: Pair<First, G>,
        _ fh: Pair<First, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Second
    ) -> Pair<First, Second> {
        Pair<First, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
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
        _ fa: Pair<First, A>,
        _ fb: Pair<First, B>,
        _ fc: Pair<First, C>,
        _ fd: Pair<First, D>,
        _ fe: Pair<First, E>,
        _ ff: Pair<First, F>,
        _ fg: Pair<First, G>,
        _ fh: Pair<First, H>,
        _ fi: Pair<First, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Second
    ) -> Pair<First, Second> {
        Pair<First, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    /// Sequential application.
    ///
    /// - Parameters:
    ///   - fa: A value in the context implementing this instance.
    /// - Returns: A value in this context, resulting from the transformation of the contained original value with the contained function.
    func ap<A, B>(_ fa: Pair<First, A>) -> Pair<First, B> where Second == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the first.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result of running the second computation after the first one.
    func zipRight<B>(_ fb: Pair<First, B>) -> Pair<First, B> {
        .map(self, fb) { _, b in b }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the second.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result produced from the first computation after both are computed.
    func zipLeft<B>(_ fb: Pair<First, B>) -> Pair<First, Second> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
