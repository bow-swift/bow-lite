public extension Either {
    static func pure(_ wrapped: Right) -> Either<Left, Right> {
        .right(wrapped)
    }
    
    static func zip<A, B>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>
    ) -> Either<Left, (A, B)> where Right == (A, B) {
        switch (fa, fb) {
            
        case (.right(let a), .right(let b)):
            return .right((a, b))
            
        case (.left(let l), _),
             (_, .left(let l)):
            return .left(l)
        }
    }
    
    static func zip<A, B, C>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>
    ) -> Either<Left, (A, B, C)> where Right == (A, B, C) {
        switch (fa, fb, fc) {
            
        case (.right(let a), .right(let b), .right(let c)):
            return .right((a, b, c))
            
        case (.left(let l), _, _),
             (_, .left(let l), _),
             (_, _, .left(let l)):
            return .left(l)
        }
    }
    
    static func zip<A, B, C, D>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>
    ) -> Either<Left, (A, B, C, D)> where Right == (A, B, C, D) {
        switch (fa, fb, fc, fd) {
            
        case (.right(let a), .right(let b), .right(let c), .right(let d)):
            return .right((a, b, c, d))
            
        case (.left(let l), _, _, _),
             (_, .left(let l), _, _),
             (_, _, .left(let l), _),
             (_, _, _, .left(let l)):
            return .left(l)
        }
    }
    
    static func zip<A, B, C, D, E>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>
    ) -> Either<Left, (A, B, C, D, E)> where Right == (A, B, C, D, E) {
        switch (fa, fb, fc, fd, fe) {
            
        case (.right(let a), .right(let b), .right(let c), .right(let d), .right(let e)):
            return .right((a, b, c, d, e))
            
        case (.left(let l), _, _, _, _),
             (_, .left(let l), _, _, _),
             (_, _, .left(let l), _, _),
             (_, _, _, .left(let l), _),
             (_, _, _, _, .left(let l)):
            return .left(l)
        }
    }
    
    static func zip<A, B, C, D, E, F>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>
    ) -> Either<Left, (A, B, C, D, E, F)> where Right == (A, B, C, D, E, F) {
        switch (fa, fb, fc, fd, fe, ff) {
            
        case (.right(let a), .right(let b), .right(let c), .right(let d), .right(let e), .right(let f)):
            return .right((a, b, c, d, e, f))
            
        case (.left(let l), _, _, _, _, _),
             (_, .left(let l), _, _, _, _),
             (_, _, .left(let l), _, _, _),
             (_, _, _, .left(let l), _, _),
             (_, _, _, _, .left(let l), _),
             (_, _, _, _, _, .left(let l)):
            return .left(l)
        }
    }
    
    static func zip<A, B, C, D, E, F, G>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>,
        _ fg: Either<Left, G>
    ) -> Either<Left, (A, B, C, D, E, F, G)> where Right == (A, B, C, D, E, F, G) {
        switch (fa, fb, fc, fd, fe, ff, fg) {
            
        case (.right(let a), .right(let b), .right(let c), .right(let d), .right(let e), .right(let f), .right(let g)):
            return .right((a, b, c, d, e, f, g))
            
        case (.left(let l), _, _, _, _, _, _),
             (_, .left(let l), _, _, _, _, _),
             (_, _, .left(let l), _, _, _, _),
             (_, _, _, .left(let l), _, _, _),
             (_, _, _, _, .left(let l), _, _),
             (_, _, _, _, _, .left(let l), _),
             (_, _, _, _, _, _, .left(let l)):
            return .left(l)
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>,
        _ fg: Either<Left, G>,
        _ fh: Either<Left, H>
    ) -> Either<Left, (A, B, C, D, E, F, G, H)> where Right == (A, B, C, D, E, F, G, H) {
        switch (fa, fb, fc, fd, fe, ff, fg, fh) {
            
        case (.right(let a), .right(let b), .right(let c), .right(let d), .right(let e), .right(let f), .right(let g), .right(let h)):
            return .right((a, b, c, d, e, f, g, h))
            
        case (.left(let l), _, _, _, _, _, _, _),
             (_, .left(let l), _, _, _, _, _, _),
             (_, _, .left(let l), _, _, _, _, _),
             (_, _, _, .left(let l), _, _, _, _),
             (_, _, _, _, .left(let l), _, _, _),
             (_, _, _, _, _, .left(let l), _, _),
             (_, _, _, _, _, _, .left(let l), _),
             (_, _, _, _, _, _, _, .left(let l)):
            return .left(l)
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H, I>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>,
        _ fg: Either<Left, G>,
        _ fh: Either<Left, H>,
        _ fi: Either<Left, I>
    ) -> Either<Left, (A, B, C, D, E, F, G, H, I)> where Right == (A, B, C, D, E, F, G, H, I) {
        switch (fa, fb, fc, fd, fe, ff, fg, fh, fi) {
            
        case (.right(let a), .right(let b), .right(let c), .right(let d), .right(let e), .right(let f), .right(let g), .right(let h), .right(let i)):
            return .right((a, b, c, d, e, f, g, h, i))
            
        case (.left(let l), _, _, _, _, _, _, _, _),
             (_, .left(let l), _, _, _, _, _, _, _),
             (_, _, .left(let l), _, _, _, _, _, _),
             (_, _, _, .left(let l), _, _, _, _, _),
             (_, _, _, _, .left(let l), _, _, _, _),
             (_, _, _, _, _, .left(let l), _, _, _),
             (_, _, _, _, _, _, .left(let l), _, _),
             (_, _, _, _, _, _, _, .left(let l), _),
             (_, _, _, _, _, _, _, _, .left(let l)):
            return .left(l)
        }
    }
    
    static func map<A, B>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ f: @escaping (A, B) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ f: @escaping (A, B, C) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ f: @escaping (A, B, C, D) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    static func map<A, B, C, D, E>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ f: @escaping (A, B, C, D, E) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
    }
    
    static func map<A, B, C, D, E, F>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
    }
    
    static func map<A, B, C, D, E, F, G>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>,
        _ fg: Either<Left, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>,
        _ fg: Either<Left, G>,
        _ fh: Either<Left, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H, I>(
        _ fa: Either<Left, A>,
        _ fb: Either<Left, B>,
        _ fc: Either<Left, C>,
        _ fd: Either<Left, D>,
        _ fe: Either<Left, E>,
        _ ff: Either<Left, F>,
        _ fg: Either<Left, G>,
        _ fh: Either<Left, H>,
        _ fi: Either<Left, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Right
    ) -> Either<Left, Right> {
        Either<Left, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    func ap<A, B>(_ fa: Either<Left, A>) -> Either<Left, B> where Right == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    func zipRight<B>(_ fb: Either<Left, B>) -> Either<Left, B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: Either<Left, B>) -> Either<Left, Right> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
