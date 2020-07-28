public extension IO {
    /// Creates a tuple out of two values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>
    ) -> IO<Failure, (A, B)> where Success == (A, B) {
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
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>
    ) -> IO<Failure, (A, B, C)> where Success == (A, B, C) {
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
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>
    ) -> IO<Failure, (A, B, C, D)> where Success == (A, B, C, D) {
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
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    ///   - e: 5th value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B, C, D, E>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>
    ) -> IO<Failure, (A, B, C, D, E)> where Success == (A, B, C, D, E) {
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
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ ff: IO<Failure, F>
    ) -> IO<Failure, (A, B, C, D, E, F)> where Success == (A, B, C, D, E, F) {
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
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    ///   - e: 5th value of the tuple.
    ///   - f: 6th value of the tuple.
    ///   - g: 7th value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B, C, D, E, F, G>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ ff: IO<Failure, F>,
        _ fg: IO<Failure, G>
    ) -> IO<Failure, (A, B, C, D, E, F, G)> where Success == (A, B, C, D, E, F, G) {
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
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ ff: IO<Failure, F>,
        _ fg: IO<Failure, G>,
        _ fh: IO<Failure, H>
    ) -> IO<Failure, (A, B, C, D, E, F, G, H)> where Success == (A, B, C, D, E, F, G, H) {
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
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ ff: IO<Failure, F>,
        _ fg: IO<Failure, G>,
        _ fh: IO<Failure, H>,
        _ fi: IO<Failure, I>
    ) -> IO<Failure, (A, B, C, D, E, F, G, H, I)> where Success == (A, B, C, D, E, F, G, H, I) {
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
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ f: @escaping (A, B) -> Success
    ) -> IO<Failure, Success> {
        IO<Failure, (A, B)>.zip(fa, fb).map(f)
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
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ f: @escaping (A, B, C) -> Success
    ) -> IO<Failure, Success> {
        IO<Failure, (A, B, C)>.zip(fa, fb, fc).map(f)
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
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ f: @escaping (A, B, C, D) -> Success
    ) -> IO<Failure, Success> {
        IO<Failure, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
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
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ f: @escaping (A, B, C, D, E) -> Success
    ) -> IO<Failure, Success> {
        IO<Failure, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
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
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ ff: IO<Failure, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Success
    ) -> IO<Failure, Success> {
        IO<Failure, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
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
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ fe: IO<Failure, E>,
        _ ff: IO<Failure, F>,
        _ fg: IO<Failure, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Success
    ) -> IO<Failure, Success> {
        IO<Failure, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
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
        IO<Failure, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
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
        IO<Failure, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    /// Sequential application.
    ///
    /// - Parameters:
    ///   - fa: A value in the context implementing this instance.
    /// - Returns: A value in this context, resulting from the transformation of the contained original value with the contained function.
    func ap<A, B>(_ fa: IO<Failure, A>) -> IO<Failure, B> where Success == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the first.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result of running the second computation after the first one.
    func zipRight<B>(_ fb: IO<Failure, B>) -> IO<Failure, B> {
        .map(self, fb) { _, b in b }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the second.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result produced from the first computation after both are computed.
    func zipLeft<B>(_ fb: IO<Failure, B>) -> IO<Failure, Success> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
