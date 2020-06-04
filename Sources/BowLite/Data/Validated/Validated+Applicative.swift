public extension Validated where Invalid: Semigroup {
    static func pure(_ valid: Valid) -> Validated<Invalid, Valid> {
        .valid(valid)
    }
    
    static func zip<A, B>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>
    ) -> Validated<Invalid, (A, B)> where Valid == (A, B) {
        switch (fa, fb) {
            
        case (.valid(let a), .valid(let b)):
            return .valid((a, b))
            
        case (.invalid(let e1), .invalid(let e2)):
            return .invalid(e1.combine(e2))
            
        case (.invalid(let l), _),
             (_, .invalid(let l)):
            return .invalid(l)
        }
    }
    
    static func zip<A, B, C>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>
    ) -> Validated<Invalid, (A, B, C)> where Valid == (A, B, C) {
        map(Validated<Invalid, (A, B)>.zip(fa, fb), fc) { x, y in
            (x.0, x.1, y)
        }
    }
    
    static func zip<A, B, C, D>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>
    ) -> Validated<Invalid, (A, B, C, D)> where Valid == (A, B, C, D) {
        map(Validated<Invalid, (A, B, C)>.zip(fa, fb, fc), fd) { x, y in
            (x.0, x.1, x.2, y)
        }
    }
    
    static func zip<A, B, C, D, E>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>
    ) -> Validated<Invalid, (A, B, C, D, E)> where Valid == (A, B, C, D, E) {
        map(Validated<Invalid, (A, B, C, D)>.zip(fa, fb, fc, fd), fe) { x, y in
            (x.0, x.1, x.2, x.3, y)
        }
    }
    
    static func zip<A, B, C, D, E, F>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>
    ) -> Validated<Invalid, (A, B, C, D, E, F)> where Valid == (A, B, C, D, E, F) {
        map(Validated<Invalid, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe), ff) { x, y in
            (x.0, x.1, x.2, x.3, x.4, y)
        }
    }
    
    static func zip<A, B, C, D, E, F, G>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>,
        _ fg: Validated<Invalid, G>
    ) -> Validated<Invalid, (A, B, C, D, E, F, G)> where Valid == (A, B, C, D, E, F, G) {
        map(Validated<Invalid, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff), fg) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, y)
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>,
        _ fg: Validated<Invalid, G>,
        _ fh: Validated<Invalid, H>
    ) -> Validated<Invalid, (A, B, C, D, E, F, G, H)> where Valid == (A, B, C, D, E, F, G, H) {
        map(Validated<Invalid, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg), fh) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, x.6, y)
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H, I>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>,
        _ fg: Validated<Invalid, G>,
        _ fh: Validated<Invalid, H>,
        _ fi: Validated<Invalid, I>
    ) -> Validated<Invalid, (A, B, C, D, E, F, G, H, I)> where Valid == (A, B, C, D, E, F, G, H, I) {
        map(Validated<Invalid, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh), fi) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, x.6, x.7, y)
        }
    }
    
    static func map<A, B>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ f: @escaping (A, B) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ f: @escaping (A, B, C) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ f: @escaping (A, B, C, D) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    static func map<A, B, C, D, E>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ f: @escaping (A, B, C, D, E) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
    }
    
    static func map<A, B, C, D, E, F>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
    }
    
    static func map<A, B, C, D, E, F, G>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>,
        _ fg: Validated<Invalid, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>,
        _ fg: Validated<Invalid, G>,
        _ fh: Validated<Invalid, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H, I>(
        _ fa: Validated<Invalid, A>,
        _ fb: Validated<Invalid, B>,
        _ fc: Validated<Invalid, C>,
        _ fd: Validated<Invalid, D>,
        _ fe: Validated<Invalid, E>,
        _ ff: Validated<Invalid, F>,
        _ fg: Validated<Invalid, G>,
        _ fh: Validated<Invalid, H>,
        _ fi: Validated<Invalid, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Valid
    ) -> Validated<Invalid, Valid> {
        Validated<Invalid, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    func ap<A, B>(_ fa: Validated<Invalid, A>) -> Validated<Invalid, B> where Valid == (A) -> B {
        switch (self, fa) {
        case (.valid(let f), .valid(let a)):
            return .valid(f(a))
        case (.invalid(let e1), .invalid(let e2)):
            return .invalid(e1.combine(e2))
        case (.invalid(let e), _), (_, .invalid(let e)):
            return .invalid(e)
        }
    }
    
    func zipValid<B>(_ fb: Validated<Invalid, B>) -> Validated<Invalid, B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: Validated<Invalid, B>) -> Validated<Invalid, Valid> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
