public extension Optional {
    static func pure(_ wrapped: Wrapped) -> Wrapped? {
        wrapped
    }
    
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
    
    static func map<A, B>(
        _ fa: A?,
        _ fb: B?,
        _ f: @escaping (A, B) -> Wrapped
    ) -> Wrapped? {
        Optional<(A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ f: @escaping (A, B, C) -> Wrapped
    ) -> Wrapped? {
        Optional<(A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: A?,
        _ fb: B?,
        _ fc: C?,
        _ fd: D?,
        _ f: @escaping (A, B, C, D) -> Wrapped
    ) -> Wrapped? {
        Optional<(A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
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
    
    func ap<A, B>(_ fa: A?) -> B? where Wrapped == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    func zipRight<B>(_ fb: B?) -> B? {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: B?) -> Wrapped? {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
