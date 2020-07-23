public extension EnvIO {
    static func zip<A, B>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>
    ) -> EnvIO<Dependencies, Failure, (A, B)> where Success == (A, B) {
        fa.flatMap { a in
            fb.map { b in (a, b) }
        }
    }
    
    static func zip<A, B, C>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>
    ) -> EnvIO<Dependencies, Failure, (A, B, C)> where Success == (A, B, C) {
        fa.flatMap { a in
            fb.flatMap { b in
                fc.map { c in (a, b, c) }
            }
        }
    }
    
    static func zip<A, B, C, D>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>
    ) -> EnvIO<Dependencies, Failure, (A, B, C, D)> where Success == (A, B, C, D) {
        fa.flatMap { a in
            fb.flatMap { b in
                fc.flatMap { c in
                    fd.map { d in (a, b, c, d) }
                }
            }
        }
    }
    
    static func zip<A, B, C, D, E>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>
    ) -> EnvIO<Dependencies, Failure, (A, B, C, D, E)> where Success == (A, B, C, D, E) {
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
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ ff: EnvIO<Dependencies, Failure, F>
    ) -> EnvIO<Dependencies, Failure, (A, B, C, D, E, F)> where Success == (A, B, C, D, E, F) {
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
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ ff: EnvIO<Dependencies, Failure, F>,
        _ fg: EnvIO<Dependencies, Failure, G>
    ) -> EnvIO<Dependencies, Failure, (A, B, C, D, E, F, G)> where Success == (A, B, C, D, E, F, G) {
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
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ ff: EnvIO<Dependencies, Failure, F>,
        _ fg: EnvIO<Dependencies, Failure, G>,
        _ fh: EnvIO<Dependencies, Failure, H>
    ) -> EnvIO<Dependencies, Failure, (A, B, C, D, E, F, G, H)> where Success == (A, B, C, D, E, F, G, H) {
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
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ ff: EnvIO<Dependencies, Failure, F>,
        _ fg: EnvIO<Dependencies, Failure, G>,
        _ fh: EnvIO<Dependencies, Failure, H>,
        _ fi: EnvIO<Dependencies, Failure, I>
    ) -> EnvIO<Dependencies, Failure, (A, B, C, D, E, F, G, H, I)> where Success == (A, B, C, D, E, F, G, H, I) {
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
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ f: @escaping (A, B) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO<Dependencies, Failure, (A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ f: @escaping (A, B, C) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO<Dependencies, Failure, (A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ f: @escaping (A, B, C, D) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO<Dependencies, Failure, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    static func map<A, B, C, D, E>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ f: @escaping (A, B, C, D, E) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO<Dependencies, Failure, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
    }
    
    static func map<A, B, C, D, E, F>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ ff: EnvIO<Dependencies, Failure, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO<Dependencies, Failure, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
    }
    
    static func map<A, B, C, D, E, F, G>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ ff: EnvIO<Dependencies, Failure, F>,
        _ fg: EnvIO<Dependencies, Failure, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO<Dependencies, Failure, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ ff: EnvIO<Dependencies, Failure, F>,
        _ fg: EnvIO<Dependencies, Failure, G>,
        _ fh: EnvIO<Dependencies, Failure, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO<Dependencies, Failure, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H, I>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ ff: EnvIO<Dependencies, Failure, F>,
        _ fg: EnvIO<Dependencies, Failure, G>,
        _ fh: EnvIO<Dependencies, Failure, H>,
        _ fi: EnvIO<Dependencies, Failure, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO<Dependencies, Failure, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    func ap<A, B>(_ fa: EnvIO<Dependencies, Failure, A>) -> EnvIO<Dependencies, Failure, B> where Success == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    func zipSuccess<B>(_ fb: EnvIO<Dependencies, Failure, B>) -> EnvIO<Dependencies, Failure, B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: EnvIO<Dependencies, Failure, B>) -> EnvIO<Dependencies, Failure, Success> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
