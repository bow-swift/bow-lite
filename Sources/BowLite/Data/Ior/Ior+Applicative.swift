public extension Ior where Left: Semigroup {
    static func pure(_ wrapped: Right) -> Ior<Left, Right> {
        .right(wrapped)
    }
    
    static func zip<A, B>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>
    ) -> Ior<Left, (A, B)> where Right == (A, B) {
        fa.fold(
            Ior.left,
            { ra in
                fb.fold(
                    Ior.left,
                    { rb in Ior.right((ra, rb)) },
                    { lb, rb in Ior.both(lb, (ra, rb)) })
            },
            { la, ra in
                fb.fold(
                    Ior.left,
                    { rb in Ior.both(la, (ra, rb)) },
                    { lb, rb in Ior.both(la.combine(lb), (ra, rb)) })
            })
        
    }
    
    static func zip<A, B, C>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ fc: Ior<Left, C>
    ) -> Ior<Left, (A, B, C)> where Right == (A, B, C) {
        map(Ior<Left, (A, B)>.zip(fa, fb), fc) { x, y in
            (x.0, x.1, y)
        }
    }
    
    static func zip<A, B, C, D>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ fc: Ior<Left, C>,
        _ fd: Ior<Left, D>
    ) -> Ior<Left, (A, B, C, D)> where Right == (A, B, C, D) {
        map(Ior<Left, (A, B, C)>.zip(fa, fb, fc), fd) { x, y in
            (x.0, x.1, x.2, y)
        }
    }
    
    static func zip<A, B, C, D, E>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ fc: Ior<Left, C>,
        _ fd: Ior<Left, D>,
        _ fe: Ior<Left, E>
    ) -> Ior<Left, (A, B, C, D, E)> where Right == (A, B, C, D, E) {
        map(Ior<Left, (A, B, C, D)>.zip(fa, fb, fc, fd), fe) { x, y in
            (x.0, x.1, x.2, x.3, y)
        }
    }
    
    static func zip<A, B, C, D, E, F>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ fc: Ior<Left, C>,
        _ fd: Ior<Left, D>,
        _ fe: Ior<Left, E>,
        _ ff: Ior<Left, F>
    ) -> Ior<Left, (A, B, C, D, E, F)> where Right == (A, B, C, D, E, F) {
        map(Ior<Left, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe), ff) { x, y in
            (x.0, x.1, x.2, x.3, x.4, y)
        }
    }
    
    static func zip<A, B, C, D, E, F, G>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ fc: Ior<Left, C>,
        _ fd: Ior<Left, D>,
        _ fe: Ior<Left, E>,
        _ ff: Ior<Left, F>,
        _ fg: Ior<Left, G>
    ) -> Ior<Left, (A, B, C, D, E, F, G)> where Right == (A, B, C, D, E, F, G) {
        map(Ior<Left, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff), fg) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, y)
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ fc: Ior<Left, C>,
        _ fd: Ior<Left, D>,
        _ fe: Ior<Left, E>,
        _ ff: Ior<Left, F>,
        _ fg: Ior<Left, G>,
        _ fh: Ior<Left, H>
    ) -> Ior<Left, (A, B, C, D, E, F, G, H)> where Right == (A, B, C, D, E, F, G, H) {
        map(Ior<Left, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg), fh) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, x.6, y)
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H, I>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ fc: Ior<Left, C>,
        _ fd: Ior<Left, D>,
        _ fe: Ior<Left, E>,
        _ ff: Ior<Left, F>,
        _ fg: Ior<Left, G>,
        _ fh: Ior<Left, H>,
        _ fi: Ior<Left, I>
    ) -> Ior<Left, (A, B, C, D, E, F, G, H, I)> where Right == (A, B, C, D, E, F, G, H, I) {
        map(Ior<Left, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh), fi) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, x.6, x.7, y)
        }
    }
    
    static func map<A, B>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ f: @escaping (A, B) -> Right
    ) -> Ior<Left, Right> {
        Ior<Left, (A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ fc: Ior<Left, C>,
        _ f: @escaping (A, B, C) -> Right
    ) -> Ior<Left, Right> {
        Ior<Left, (A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ fc: Ior<Left, C>,
        _ fd: Ior<Left, D>,
        _ f: @escaping (A, B, C, D) -> Right
    ) -> Ior<Left, Right> {
        Ior<Left, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    static func map<A, B, C, D, E>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ fc: Ior<Left, C>,
        _ fd: Ior<Left, D>,
        _ fe: Ior<Left, E>,
        _ f: @escaping (A, B, C, D, E) -> Right
    ) -> Ior<Left, Right> {
        Ior<Left, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
    }
    
    static func map<A, B, C, D, E, F>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ fc: Ior<Left, C>,
        _ fd: Ior<Left, D>,
        _ fe: Ior<Left, E>,
        _ ff: Ior<Left, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Right
    ) -> Ior<Left, Right> {
        Ior<Left, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
    }
    
    static func map<A, B, C, D, E, F, G>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ fc: Ior<Left, C>,
        _ fd: Ior<Left, D>,
        _ fe: Ior<Left, E>,
        _ ff: Ior<Left, F>,
        _ fg: Ior<Left, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Right
    ) -> Ior<Left, Right> {
        Ior<Left, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ fc: Ior<Left, C>,
        _ fd: Ior<Left, D>,
        _ fe: Ior<Left, E>,
        _ ff: Ior<Left, F>,
        _ fg: Ior<Left, G>,
        _ fh: Ior<Left, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Right
    ) -> Ior<Left, Right> {
        Ior<Left, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H, I>(
        _ fa: Ior<Left, A>,
        _ fb: Ior<Left, B>,
        _ fc: Ior<Left, C>,
        _ fd: Ior<Left, D>,
        _ fe: Ior<Left, E>,
        _ ff: Ior<Left, F>,
        _ fg: Ior<Left, G>,
        _ fh: Ior<Left, H>,
        _ fi: Ior<Left, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Right
    ) -> Ior<Left, Right> {
        Ior<Left, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    func ap<A, B>(_ fa: Ior<Left, A>) -> Ior<Left, B> where Right == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    func zipRight<B>(_ fb: Ior<Left, B>) -> Ior<Left, B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: Ior<Left, B>) -> Ior<Left, Right> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
