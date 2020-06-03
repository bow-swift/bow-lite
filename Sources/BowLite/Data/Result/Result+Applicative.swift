public extension Result {
    static func pure(_ wrapped: Success) -> Result<Success, Failure> {
        .success(wrapped)
    }
    
    static func zip<A, B>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>
    ) -> Result<(A, B), Failure> where Success == (A, B) {
        switch (fa, fb) {
            
        case (.success(let a), .success(let b)):
            return .success((a, b))
            
        case (.failure(let l), _),
             (_, .failure(let l)):
            return .failure(l)
        }
    }
    
    static func zip<A, B, C>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>
    ) -> Result<(A, B, C), Failure> where Success == (A, B, C) {
        switch (fa, fb, fc) {
            
        case (.success(let a), .success(let b), .success(let c)):
            return .success((a, b, c))
            
        case (.failure(let l), _, _),
             (_, .failure(let l), _),
             (_, _, .failure(let l)):
            return .failure(l)
        }
    }
    
    static func zip<A, B, C, D>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>
    ) -> Result<(A, B, C, D), Failure> where Success == (A, B, C, D) {
        switch (fa, fb, fc, fd) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d)):
            return .success((a, b, c, d))
            
        case (.failure(let l), _, _, _),
             (_, .failure(let l), _, _),
             (_, _, .failure(let l), _),
             (_, _, _, .failure(let l)):
            return .failure(l)
        }
    }
    
    static func zip<A, B, C, D, E>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>
    ) -> Result<(A, B, C, D, E), Failure> where Success == (A, B, C, D, E) {
        switch (fa, fb, fc, fd, fe) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e)):
            return .success((a, b, c, d, e))
            
        case (.failure(let l), _, _, _, _),
             (_, .failure(let l), _, _, _),
             (_, _, .failure(let l), _, _),
             (_, _, _, .failure(let l), _),
             (_, _, _, _, .failure(let l)):
            return .failure(l)
        }
    }
    
    static func zip<A, B, C, D, E, F>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>
    ) -> Result<(A, B, C, D, E, F), Failure> where Success == (A, B, C, D, E, F) {
        switch (fa, fb, fc, fd, fe, ff) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e), .success(let f)):
            return .success((a, b, c, d, e, f))
            
        case (.failure(let l), _, _, _, _, _),
             (_, .failure(let l), _, _, _, _),
             (_, _, .failure(let l), _, _, _),
             (_, _, _, .failure(let l), _, _),
             (_, _, _, _, .failure(let l), _),
             (_, _, _, _, _, .failure(let l)):
            return .failure(l)
        }
    }
    
    static func zip<A, B, C, D, E, F, G>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>,
        _ fg: Result<G, Failure>
    ) -> Result<(A, B, C, D, E, F, G), Failure> where Success == (A, B, C, D, E, F, G) {
        switch (fa, fb, fc, fd, fe, ff, fg) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e), .success(let f), .success(let g)):
            return .success((a, b, c, d, e, f, g))
            
        case (.failure(let l), _, _, _, _, _, _),
             (_, .failure(let l), _, _, _, _, _),
             (_, _, .failure(let l), _, _, _, _),
             (_, _, _, .failure(let l), _, _, _),
             (_, _, _, _, .failure(let l), _, _),
             (_, _, _, _, _, .failure(let l), _),
             (_, _, _, _, _, _, .failure(let l)):
            return .failure(l)
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>,
        _ fg: Result<G, Failure>,
        _ fh: Result<H, Failure>
    ) -> Result<(A, B, C, D, E, F, G, H), Failure> where Success == (A, B, C, D, E, F, G, H) {
        switch (fa, fb, fc, fd, fe, ff, fg, fh) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e), .success(let f), .success(let g), .success(let h)):
            return .success((a, b, c, d, e, f, g, h))
            
        case (.failure(let l), _, _, _, _, _, _, _),
             (_, .failure(let l), _, _, _, _, _, _),
             (_, _, .failure(let l), _, _, _, _, _),
             (_, _, _, .failure(let l), _, _, _, _),
             (_, _, _, _, .failure(let l), _, _, _),
             (_, _, _, _, _, .failure(let l), _, _),
             (_, _, _, _, _, _, .failure(let l), _),
             (_, _, _, _, _, _, _, .failure(let l)):
            return .failure(l)
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H, I>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>,
        _ fg: Result<G, Failure>,
        _ fh: Result<H, Failure>,
        _ fi: Result<I, Failure>
    ) -> Result<(A, B, C, D, E, F, G, H, I), Failure> where Success == (A, B, C, D, E, F, G, H, I) {
        switch (fa, fb, fc, fd, fe, ff, fg, fh, fi) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e), .success(let f), .success(let g), .success(let h), .success(let i)):
            return .success((a, b, c, d, e, f, g, h, i))
            
        case (.failure(let l), _, _, _, _, _, _, _, _),
             (_, .failure(let l), _, _, _, _, _, _, _),
             (_, _, .failure(let l), _, _, _, _, _, _),
             (_, _, _, .failure(let l), _, _, _, _, _),
             (_, _, _, _, .failure(let l), _, _, _, _),
             (_, _, _, _, _, .failure(let l), _, _, _),
             (_, _, _, _, _, _, .failure(let l), _, _),
             (_, _, _, _, _, _, _, .failure(let l), _),
             (_, _, _, _, _, _, _, _, .failure(let l)):
            return .failure(l)
        }
    }
    
    static func map<A, B>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ f: @escaping (A, B) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B), Failure>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ f: @escaping (A, B, C) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B, C), Failure>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ f: @escaping (A, B, C, D) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B, C, D), Failure>.zip(fa, fb, fc, fd).map(f)
    }
    
    static func map<A, B, C, D, E>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ f: @escaping (A, B, C, D, E) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B, C, D, E), Failure>.zip(fa, fb, fc, fd, fe).map(f)
    }
    
    static func map<A, B, C, D, E, F>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>,
        _ f: @escaping (A, B, C, D, E, F) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B, C, D, E, F), Failure>.zip(fa, fb, fc, fd, fe, ff).map(f)
    }
    
    static func map<A, B, C, D, E, F, G>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>,
        _ fg: Result<G, Failure>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B, C, D, E, F, G), Failure>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>,
        _ fg: Result<G, Failure>,
        _ fh: Result<H, Failure>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B, C, D, E, F, G, H), Failure>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H, I>(
        _ fa: Result<A, Failure>,
        _ fb: Result<B, Failure>,
        _ fc: Result<C, Failure>,
        _ fd: Result<D, Failure>,
        _ fe: Result<E, Failure>,
        _ ff: Result<F, Failure>,
        _ fg: Result<G, Failure>,
        _ fh: Result<H, Failure>,
        _ fi: Result<I, Failure>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Success
    ) -> Result<Success, Failure> {
        Result<(A, B, C, D, E, F, G, H, I), Failure>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    func ap<A, B>(_ fa: Result<A, Failure>) -> Result<B, Failure> where Success == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    func zipRight<B>(_ fb: Result<B, Failure>) -> Result<B, Failure> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: Result<B, Failure>) -> Result<Success, Failure> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
