public extension IO {
    static func zip<A, B>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>
    ) -> IO<Failure, (A, B)> where Success == (A, B) {
        fa.flatMap { a in
            fb.map { b in (a, b) }
        }
    }
    
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
    
    static func map<A, B>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ f: @escaping (A, B) -> Success
    ) -> IO<Failure, Success> {
        IO<Failure, (A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ f: @escaping (A, B, C) -> Success
    ) -> IO<Failure, Success> {
        IO<Failure, (A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ fd: IO<Failure, D>,
        _ f: @escaping (A, B, C, D) -> Success
    ) -> IO<Failure, Success> {
        IO<Failure, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
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
    
    func ap<A, B>(_ fa: IO<Failure, A>) -> IO<Failure, B> where Success == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    func zipSuccess<B>(_ fb: IO<Failure, B>) -> IO<Failure, B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: IO<Failure, B>) -> IO<Failure, Success> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
