public extension Eval {
    /// Creates a tuple out of two values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B>(
        _ fa: Eval<A>,
        _ fb: Eval<B>
    ) -> Eval<(A, B)> where Value == (A, B) {
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>
    ) -> Eval<(A, B, C)> where Value == (A, B, C) {
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ fd: Eval<D>
    ) -> Eval<(A, B, C, D)> where Value == (A, B, C, D) {
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ fd: Eval<D>,
        _ fe: Eval<E>
    ) -> Eval<(A, B, C, D, E)> where Value == (A, B, C, D, E) {
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ fd: Eval<D>,
        _ fe: Eval<E>,
        _ ff: Eval<F>
    ) -> Eval<(A, B, C, D, E, F)> where Value == (A, B, C, D, E, F) {
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ fd: Eval<D>,
        _ fe: Eval<E>,
        _ ff: Eval<F>,
        _ fg: Eval<G>
    ) -> Eval<(A, B, C, D, E, F, G)> where Value == (A, B, C, D, E, F, G) {
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ fd: Eval<D>,
        _ fe: Eval<E>,
        _ ff: Eval<F>,
        _ fg: Eval<G>,
        _ fh: Eval<H>
    ) -> Eval<(A, B, C, D, E, F, G, H)> where Value == (A, B, C, D, E, F, G, H) {
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ fd: Eval<D>,
        _ fe: Eval<E>,
        _ ff: Eval<F>,
        _ fg: Eval<G>,
        _ fh: Eval<H>,
        _ fi: Eval<I>
    ) -> Eval<(A, B, C, D, E, F, G, H, I)> where Value == (A, B, C, D, E, F, G, H, I) {
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ f: @escaping (A, B) -> Value
    ) -> Eval<Value> {
        Eval<(A, B)>.zip(fa, fb).map(f)
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ f: @escaping (A, B, C) -> Value
    ) -> Eval<Value> {
        Eval<(A, B, C)>.zip(fa, fb, fc).map(f)
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ fd: Eval<D>,
        _ f: @escaping (A, B, C, D) -> Value
    ) -> Eval<Value> {
        Eval<(A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ fd: Eval<D>,
        _ fe: Eval<E>,
        _ f: @escaping (A, B, C, D, E) -> Value
    ) -> Eval<Value> {
        Eval<(A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ fd: Eval<D>,
        _ fe: Eval<E>,
        _ ff: Eval<F>,
        _ f: @escaping (A, B, C, D, E, F) -> Value
    ) -> Eval<Value> {
        Eval<(A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ fd: Eval<D>,
        _ fe: Eval<E>,
        _ ff: Eval<F>,
        _ fg: Eval<G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Value
    ) -> Eval<Value> {
        Eval<(A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ fd: Eval<D>,
        _ fe: Eval<E>,
        _ ff: Eval<F>,
        _ fg: Eval<G>,
        _ fh: Eval<H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Value
    ) -> Eval<Value> {
        Eval<(A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
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
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ fd: Eval<D>,
        _ fe: Eval<E>,
        _ ff: Eval<F>,
        _ fg: Eval<G>,
        _ fh: Eval<H>,
        _ fi: Eval<I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Value
    ) -> Eval<Value> {
        Eval<(A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    /// Sequential application.
    ///
    /// - Parameters:
    ///   - fa: A value in the context implementing this instance.
    /// - Returns: A value in this context, resulting from the transformation of the contained original value with the contained function.
    func ap<A, B>(_ fa: Eval<A>) -> Eval<B> where Value == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the first.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result of running the second computation after the first one.
    func zipRight<B>(_ fb: Eval<B>) -> Eval<B> {
        .map(self, fb) { _, b in b }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the second.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result produced from the first computation after both are computed.
    func zipLeft<B>(_ fb: Eval<B>) -> Eval<Value> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
