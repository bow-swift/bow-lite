public extension Eval {
    static func zip<A, B>(
        _ fa: Eval<A>,
        _ fb: Eval<B>
    ) -> Eval<(A, B)> where Value == (A, B) {
        fa.flatMap { a in
            fb.map { b in (a, b) }
        }
    }
    
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
    
    static func map<A, B>(
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ f: @escaping (A, B) -> Value
    ) -> Eval<Value> {
        Eval<(A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ f: @escaping (A, B, C) -> Value
    ) -> Eval<Value> {
        Eval<(A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: Eval<A>,
        _ fb: Eval<B>,
        _ fc: Eval<C>,
        _ fd: Eval<D>,
        _ f: @escaping (A, B, C, D) -> Value
    ) -> Eval<Value> {
        Eval<(A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
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
    
    func ap<A, B>(_ fa: Eval<A>) -> Eval<B> where Value == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    func zipValue<B>(_ fb: Eval<B>) -> Eval<B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: Eval<B>) -> Eval<Value> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
