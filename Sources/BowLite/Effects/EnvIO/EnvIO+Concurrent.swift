public extension EnvIO {
    static func parZip<A, B>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>
    ) -> EnvIO<Dependencies, Failure, Success> where Success == (A, B) {
        Self.parMap(fa, fb) { a, b in (a, b) }
    }
    
    static func parZip<A, B, C>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>
    ) -> EnvIO<Dependencies, Failure, Success> where Success == (A, B, C) {
        Self.parMap(fa, fb, fc) { a, b, c in (a, b, c) }
    }
    
    static func parZip<A, B, C, D>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>
    ) -> EnvIO<Dependencies, Failure, Success> where Success == (A, B, C, D) {
        Self.parMap(fa, fb, fc, fd) { a, b, c, d in (a, b, c, d) }
    }
    
    static func parZip<A, B, C, D, E>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>
    ) -> EnvIO<Dependencies, Failure, Success> where Success == (A, B, C, D, E) {
        Self.parMap(fa, fb, fc, fd, fe) { a, b, c, d, e in (a, b, c, d, e) }
    }
    
    static func parZip<A, B, C, D, E, F>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ ff: EnvIO<Dependencies, Failure, F>
    ) -> EnvIO<Dependencies, Failure, Success> where Success == (A, B, C, D, E, F) {
        Self.parMap(fa, fb, fc, fd, fe, ff) { a, b, c, d, e, f in (a, b, c, d, e, f) }
    }
    
    static func parZip<A, B, C, D, E, F, G>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ ff: EnvIO<Dependencies, Failure, F>,
        _ fg: EnvIO<Dependencies, Failure, G>
    ) -> EnvIO<Dependencies, Failure, Success> where Success == (A, B, C, D, E, F, G) {
        Self.parMap(fa, fb, fc, fd, fe, ff, fg) { a, b, c, d, e, f, g in (a, b, c, d, e, f, g) }
    }
    
    static func parZip<A, B, C, D, E, F, G, H>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ ff: EnvIO<Dependencies, Failure, F>,
        _ fg: EnvIO<Dependencies, Failure, G>,
        _ fh: EnvIO<Dependencies, Failure, H>
    ) -> EnvIO<Dependencies, Failure, Success> where Success == (A, B, C, D, E, F, G, H) {
        Self.parMap(fa, fb, fc, fd, fe, ff, fg, fh) { a, b, c, d, e, f, g, h in (a, b, c, d, e, f, g, h) }
    }
    
    static func parZip<A, B, C, D, E, F, G, H, I>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ ff: EnvIO<Dependencies, Failure, F>,
        _ fg: EnvIO<Dependencies, Failure, G>,
        _ fh: EnvIO<Dependencies, Failure, H>,
        _ fi: EnvIO<Dependencies, Failure, I>
    ) -> EnvIO<Dependencies, Failure, Success> where Success == (A, B, C, D, E, F, G, H, I) {
        Self.parMap(fa, fb, fc, fd, fe, ff, fg, fh, fi) { a, b, c, d, e, f, g, h, i in (a, b, c, d, e, f, g, h, i) }
    }
    
    static func parMap<A, B, C, D>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ f: @escaping (A, B, C, D) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        parMap(
            EnvIO<Dependencies, Failure, (A, B)>.parZip(fa, fb),
            EnvIO<Dependencies, Failure, (C, D)>.parZip(fc, fd)
        ) { x, y in f(x.0, x.1, y.0, y.1) }
    }
    
    static func parMap<A, B, C, D, E>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ f: @escaping (A, B, C, D, E) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        parMap(
            EnvIO<Dependencies, Failure, (A, B, C)>.parZip(fa, fb, fc),
            EnvIO<Dependencies, Failure, (D, E)>.parZip(fd, fe)
        ) { x, y in f(x.0, x.1, x.2, y.0, y.1) }
    }
    
    static func parMap<A, B, C, D, E, F>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ ff: EnvIO<Dependencies, Failure, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        parMap(
            EnvIO<Dependencies, Failure, (A, B, C)>.parZip(fa, fb, fc),
            EnvIO<Dependencies, Failure, (D, E, F)>.parZip(fd, fe, ff)
        ) { x, y in f(x.0, x.1, x.2, y.0, y.1, y.2) }
    }
    
    static func parMap<A, B, C, D, E, F, G>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ fd: EnvIO<Dependencies, Failure, D>,
        _ fe: EnvIO<Dependencies, Failure, E>,
        _ ff: EnvIO<Dependencies, Failure, F>,
        _ fg: EnvIO<Dependencies, Failure, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        parMap(
            EnvIO<Dependencies, Failure, (A, B, C)>.parZip(fa, fb, fc),
            EnvIO<Dependencies, Failure, (D, E)>.parZip(fd, fe),
            EnvIO<Dependencies, Failure, (F, G)>.parZip(ff, fg)
        ) { x, y, z in f(x.0, x.1, x.2, y.0, y.1, z.0, z.1) }
    }
    
    static func parMap<A, B, C, D, E, F, G, H>(
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
        parMap(
            EnvIO<Dependencies, Failure, (A, B, C)>.parZip(fa, fb, fc),
            EnvIO<Dependencies, Failure, (D, E, F)>.parZip(fd, fe, ff),
            EnvIO<Dependencies, Failure, (G, H)>.parZip(fg, fh)
        ) { x, y, z in f(x.0, x.1, x.2, y.0, y.1, y.2, z.0, z.1) }
    }
    
    static func parMap<A, B, C, D, E, F, G, H, I>(
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
        parMap(
            EnvIO<Dependencies, Failure, (A, B, C)>.parZip(fa, fb, fc),
            EnvIO<Dependencies, Failure, (D, E, F)>.parZip(fd, fe, ff),
            EnvIO<Dependencies, Failure, (G, H, I)>.parZip(fg, fh, fi)
        ) { x, y, z in f(x.0, x.1, x.2, y.0, y.1, y.2, z.0, z.1, z.2) }
    }
}
