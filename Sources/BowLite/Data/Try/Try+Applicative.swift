public extension Try {
    static func pure(_ success: Success) -> Try<Success> {
        .success(success)
    }
    
    static func zip<A, B>(
        _ fa: Try<A>,
        _ fb: Try<B>
    ) -> Try<(A, B)> where Success == (A, B) {
        switch (fa, fb) {
            
        case (.success(let a), .success(let b)):
            return .success((a, b))
            
        case (.failure(let e), _),
             (_, .failure(let e)):
            return .failure(e)
        }
    }
    
    static func zip<A, B, C>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ fc: Try<C>
    ) -> Try<(A, B, C)> where Success == (A, B, C) {
        switch (fa, fb, fc) {
            
        case (.success(let a), .success(let b), .success(let c)):
            return .success((a, b, c))
            
        case (.failure(let e), _, _),
             (_, .failure(let e), _),
             (_, _, .failure(let e)):
            return .failure(e)
        }
    }
    
    static func zip<A, B, C, D>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ fc: Try<C>,
        _ fd: Try<D>
    ) -> Try<(A, B, C, D)> where Success == (A, B, C, D) {
        switch (fa, fb, fc, fd) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d)):
            return .success((a, b, c, d))
            
        case (.failure(let e), _, _, _),
             (_, .failure(let e), _, _),
             (_, _, .failure(let e), _),
             (_, _, _, .failure(let e)):
            return .failure(e)
        }
    }
    
    static func zip<A, B, C, D, E>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ fc: Try<C>,
        _ fd: Try<D>,
        _ fe: Try<E>
    ) -> Try<(A, B, C, D, E)> where Success == (A, B, C, D, E) {
        switch (fa, fb, fc, fd, fe) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e)):
            return .success((a, b, c, d, e))
            
        case (.failure(let e), _, _, _, _),
             (_, .failure(let e), _, _, _),
             (_, _, .failure(let e), _, _),
             (_, _, _, .failure(let e), _),
             (_, _, _, _, .failure(let e)):
            return .failure(e)
        }
    }
    
    static func zip<A, B, C, D, E, F>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ fc: Try<C>,
        _ fd: Try<D>,
        _ fe: Try<E>,
        _ ff: Try<F>
    ) -> Try<(A, B, C, D, E, F)> where Success == (A, B, C, D, E, F) {
        switch (fa, fb, fc, fd, fe, ff) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e), .success(let f)):
            return .success((a, b, c, d, e, f))
            
        case (.failure(let e), _, _, _, _, _),
             (_, .failure(let e), _, _, _, _),
             (_, _, .failure(let e), _, _, _),
             (_, _, _, .failure(let e), _, _),
             (_, _, _, _, .failure(let e), _),
             (_, _, _, _, _, .failure(let e)):
            return .failure(e)
        }
    }
    
    static func zip<A, B, C, D, E, F, G>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ fc: Try<C>,
        _ fd: Try<D>,
        _ fe: Try<E>,
        _ ff: Try<F>,
        _ fg: Try<G>
    ) -> Try<(A, B, C, D, E, F, G)> where Success == (A, B, C, D, E, F, G) {
        switch (fa, fb, fc, fd, fe, ff, fg) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e), .success(let f), .success(let g)):
            return .success((a, b, c, d, e, f, g))
            
        case (.failure(let e), _, _, _, _, _, _),
             (_, .failure(let e), _, _, _, _, _),
             (_, _, .failure(let e), _, _, _, _),
             (_, _, _, .failure(let e), _, _, _),
             (_, _, _, _, .failure(let e), _, _),
             (_, _, _, _, _, .failure(let e), _),
             (_, _, _, _, _, _, .failure(let e)):
            return .failure(e)
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ fc: Try<C>,
        _ fd: Try<D>,
        _ fe: Try<E>,
        _ ff: Try<F>,
        _ fg: Try<G>,
        _ fh: Try<H>
    ) -> Try<(A, B, C, D, E, F, G, H)> where Success == (A, B, C, D, E, F, G, H) {
        switch (fa, fb, fc, fd, fe, ff, fg, fh) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e), .success(let f), .success(let g), .success(let h)):
            return .success((a, b, c, d, e, f, g, h))
            
        case (.failure(let e), _, _, _, _, _, _, _),
             (_, .failure(let e), _, _, _, _, _, _),
             (_, _, .failure(let e), _, _, _, _, _),
             (_, _, _, .failure(let e), _, _, _, _),
             (_, _, _, _, .failure(let e), _, _, _),
             (_, _, _, _, _, .failure(let e), _, _),
             (_, _, _, _, _, _, .failure(let e), _),
             (_, _, _, _, _, _, _, .failure(let e)):
            return .failure(e)
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H, I>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ fc: Try<C>,
        _ fd: Try<D>,
        _ fe: Try<E>,
        _ ff: Try<F>,
        _ fg: Try<G>,
        _ fh: Try<H>,
        _ fi: Try<I>
    ) -> Try<(A, B, C, D, E, F, G, H, I)> where Success == (A, B, C, D, E, F, G, H, I) {
        switch (fa, fb, fc, fd, fe, ff, fg, fh, fi) {
            
        case (.success(let a), .success(let b), .success(let c), .success(let d), .success(let e), .success(let f), .success(let g), .success(let h), .success(let i)):
            return .success((a, b, c, d, e, f, g, h, i))
            
        case (.failure(let e), _, _, _, _, _, _, _, _),
             (_, .failure(let e), _, _, _, _, _, _, _),
             (_, _, .failure(let e), _, _, _, _, _, _),
             (_, _, _, .failure(let e), _, _, _, _, _),
             (_, _, _, _, .failure(let e), _, _, _, _),
             (_, _, _, _, _, .failure(let e), _, _, _),
             (_, _, _, _, _, _, .failure(let e), _, _),
             (_, _, _, _, _, _, _, .failure(let e), _),
             (_, _, _, _, _, _, _, _, .failure(let e)):
            return .failure(e)
        }
    }
    
    static func map<A, B>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ f: @escaping (A, B) -> Success
    ) -> Try<Success> {
        Try<(A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ fc: Try<C>,
        _ f: @escaping (A, B, C) -> Success
    ) -> Try<Success> {
        Try<(A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ fc: Try<C>,
        _ fd: Try<D>,
        _ f: @escaping (A, B, C, D) -> Success
    ) -> Try<Success> {
        Try<(A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    static func map<A, B, C, D, E>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ fc: Try<C>,
        _ fd: Try<D>,
        _ fe: Try<E>,
        _ f: @escaping (A, B, C, D, E) -> Success
    ) -> Try<Success> {
        Try<(A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
    }
    
    static func map<A, B, C, D, E, F>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ fc: Try<C>,
        _ fd: Try<D>,
        _ fe: Try<E>,
        _ ff: Try<F>,
        _ f: @escaping (A, B, C, D, E, F) -> Success
    ) -> Try<Success> {
        Try<(A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
    }
    
    static func map<A, B, C, D, E, F, G>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ fc: Try<C>,
        _ fd: Try<D>,
        _ fe: Try<E>,
        _ ff: Try<F>,
        _ fg: Try<G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Success
    ) -> Try<Success> {
        Try<(A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ fc: Try<C>,
        _ fd: Try<D>,
        _ fe: Try<E>,
        _ ff: Try<F>,
        _ fg: Try<G>,
        _ fh: Try<H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Success
    ) -> Try<Success> {
        Try<(A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H, I>(
        _ fa: Try<A>,
        _ fb: Try<B>,
        _ fc: Try<C>,
        _ fd: Try<D>,
        _ fe: Try<E>,
        _ ff: Try<F>,
        _ fg: Try<G>,
        _ fh: Try<H>,
        _ fi: Try<I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Success
    ) -> Try<Success> {
        Try<(A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    func ap<A, B>(_ fa: Try<A>) -> Try<B> where Success == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    func zipSuccess<B>(_ fb: Try<B>) -> Try<B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: Try<B>) -> Try<Success> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
