public extension Id {
    static func pure(_ wrapped: Wrapped) -> Id<Wrapped> {
        Id(wrapped)
    }
    
    static func zip<A, B>(
        _ fa: Id<A>,
        _ fb: Id<B>
    ) -> Id<(A, B)> where Wrapped == (A, B) {
        Id((fa.value, fb.value))
    }
    
    static func zip<A, B, C>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ fc: Id<C>
    ) -> Id<(A, B, C)> where Wrapped == (A, B, C) {
        Id((fa.value, fb.value, fc.value))
    }
    
    static func zip<A, B, C, D>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ fc: Id<C>,
        _ fd: Id<D>
    ) -> Id<(A, B, C, D)> where Wrapped == (A, B, C, D) {
        Id((fa.value, fb.value, fc.value, fd.value))
    }
    
    static func zip<A, B, C, D, E>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ fc: Id<C>,
        _ fd: Id<D>,
        _ fe: Id<E>
    ) -> Id<(A, B, C, D, E)> where Wrapped == (A, B, C, D, E) {
        Id((fa.value, fb.value, fc.value, fd.value, fe.value))
    }
    
    static func zip<A, B, C, D, E, F>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ fc: Id<C>,
        _ fd: Id<D>,
        _ fe: Id<E>,
        _ ff: Id<F>
    ) -> Id<(A, B, C, D, E, F)> where Wrapped == (A, B, C, D, E, F) {
        Id((fa.value, fb.value, fc.value, fd.value, fe.value, ff.value))
    }
    
    static func zip<A, B, C, D, E, F, G>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ fc: Id<C>,
        _ fd: Id<D>,
        _ fe: Id<E>,
        _ ff: Id<F>,
        _ fg: Id<G>
    ) -> Id<(A, B, C, D, E, F, G)> where Wrapped == (A, B, C, D, E, F, G) {
        Id((fa.value, fb.value, fc.value, fd.value, fe.value, ff.value, fg.value))
    }
    
    static func zip<A, B, C, D, E, F, G, H>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ fc: Id<C>,
        _ fd: Id<D>,
        _ fe: Id<E>,
        _ ff: Id<F>,
        _ fg: Id<G>,
        _ fh: Id<H>
    ) -> Id<(A, B, C, D, E, F, G, H)> where Wrapped == (A, B, C, D, E, F, G, H) {
        Id((fa.value, fb.value, fc.value, fd.value, fe.value, ff.value, fg.value, fh.value))
    }
    
    static func zip<A, B, C, D, E, F, G, H, I>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ fc: Id<C>,
        _ fd: Id<D>,
        _ fe: Id<E>,
        _ ff: Id<F>,
        _ fg: Id<G>,
        _ fh: Id<H>,
        _ fi: Id<I>
    ) -> Id<(A, B, C, D, E, F, G, H, I)> where Wrapped == (A, B, C, D, E, F, G, H, I) {
        Id((fa.value, fb.value, fc.value, fd.value, fe.value, ff.value, fg.value, fh.value, fi.value))
    }
    
    static func map<A, B>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ f: @escaping (A, B) -> Wrapped
    ) -> Id<Wrapped> {
        Id<(A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ fc: Id<C>,
        _ f: @escaping (A, B, C) -> Wrapped
    ) -> Id<Wrapped> {
        Id<(A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ fc: Id<C>,
        _ fd: Id<D>,
        _ f: @escaping (A, B, C, D) -> Wrapped
    ) -> Id<Wrapped> {
        Id<(A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    static func map<A, B, C, D, E>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ fc: Id<C>,
        _ fd: Id<D>,
        _ fe: Id<E>,
        _ f: @escaping (A, B, C, D, E) -> Wrapped
    ) -> Id<Wrapped> {
        Id<(A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
    }
    
    static func map<A, B, C, D, E, F>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ fc: Id<C>,
        _ fd: Id<D>,
        _ fe: Id<E>,
        _ ff: Id<F>,
        _ f: @escaping (A, B, C, D, E, F) -> Wrapped
    ) -> Id<Wrapped> {
        Id<(A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
    }
    
    static func map<A, B, C, D, E, F, G>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ fc: Id<C>,
        _ fd: Id<D>,
        _ fe: Id<E>,
        _ ff: Id<F>,
        _ fg: Id<G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Wrapped
    ) -> Id<Wrapped> {
        Id<(A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ fc: Id<C>,
        _ fd: Id<D>,
        _ fe: Id<E>,
        _ ff: Id<F>,
        _ fg: Id<G>,
        _ fh: Id<H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Wrapped
    ) -> Id<Wrapped> {
        Id<(A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H, I>(
        _ fa: Id<A>,
        _ fb: Id<B>,
        _ fc: Id<C>,
        _ fd: Id<D>,
        _ fe: Id<E>,
        _ ff: Id<F>,
        _ fg: Id<G>,
        _ fh: Id<H>,
        _ fi: Id<I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Wrapped
    ) -> Id<Wrapped> {
        Id<(A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    func ap<A, B>(_ fa: Id<A>) -> Id<B> where Wrapped == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    func zipWrapped<B>(_ fb: Id<B>) -> Id<B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: Id<B>) -> Id<Wrapped> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
