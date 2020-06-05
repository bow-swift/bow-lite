public extension NonEmptyArray {
    static func pure(_ element: Element) -> NonEmptyArray<Element> {
        NEA(element)
    }
    
    static func zip<A, B>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>
    ) -> NonEmptyArray<(A, B)> where Element == (A, B) {
        fa.flatMap { a in
            fb.map { b in (a, b) }
        }
    }
    
    static func zip<A, B, C>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>
    ) -> NonEmptyArray<(A, B, C)> where Element == (A, B, C) {
        map(NonEmptyArray<(A, B)>.zip(fa, fb), fc) { x, y in
            (x.0, x.1, y)
        }
    }
    
    static func zip<A, B, C, D>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ fd: NonEmptyArray<D>
    ) -> NonEmptyArray<(A, B, C, D)> where Element == (A, B, C, D) {
        map(NonEmptyArray<(A, B, C)>.zip(fa, fb, fc), fd) { x, y in
            (x.0, x.1, x.2, y)
        }
    }
    
    static func zip<A, B, C, D, E>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ fd: NonEmptyArray<D>,
        _ fe: NonEmptyArray<E>
    ) -> NonEmptyArray<(A, B, C, D, E)> where Element == (A, B, C, D, E) {
        map(NonEmptyArray<(A, B, C, D)>.zip(fa, fb, fc, fd), fe) { x, y in
            (x.0, x.1, x.2, x.3, y)
        }
    }
    
    static func zip<A, B, C, D, E, F>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ fd: NonEmptyArray<D>,
        _ fe: NonEmptyArray<E>,
        _ ff: NonEmptyArray<F>
    ) -> NonEmptyArray<(A, B, C, D, E, F)> where Element == (A, B, C, D, E, F) {
        map(NonEmptyArray<(A, B, C, D, E)>.zip(fa, fb, fc, fd, fe), ff) { x, y in
            (x.0, x.1, x.2, x.3, x.4, y)
        }
    }
    
    static func zip<A, B, C, D, E, F, G>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ fd: NonEmptyArray<D>,
        _ fe: NonEmptyArray<E>,
        _ ff: NonEmptyArray<F>,
        _ fg: NonEmptyArray<G>
    ) -> NonEmptyArray<(A, B, C, D, E, F, G)> where Element == (A, B, C, D, E, F, G) {
        map(NonEmptyArray<(A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff), fg) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, y)
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ fd: NonEmptyArray<D>,
        _ fe: NonEmptyArray<E>,
        _ ff: NonEmptyArray<F>,
        _ fg: NonEmptyArray<G>,
        _ fh: NonEmptyArray<H>
    ) -> NonEmptyArray<(A, B, C, D, E, F, G, H)> where Element == (A, B, C, D, E, F, G, H) {
        map(NonEmptyArray<(A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg), fh) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, x.6, y)
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H, I>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ fd: NonEmptyArray<D>,
        _ fe: NonEmptyArray<E>,
        _ ff: NonEmptyArray<F>,
        _ fg: NonEmptyArray<G>,
        _ fh: NonEmptyArray<H>,
        _ fi: NonEmptyArray<I>
    ) -> NonEmptyArray<(A, B, C, D, E, F, G, H, I)> where Element == (A, B, C, D, E, F, G, H, I) {
        map(NonEmptyArray<(A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh), fi) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, x.6, x.7, y)
        }
    }
    
    static func map<A, B>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ f: @escaping (A, B) -> Element
    ) -> NonEmptyArray<Element> {
        NonEmptyArray<(A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ f: @escaping (A, B, C) -> Element
    ) -> NonEmptyArray<Element> {
        NonEmptyArray<(A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ fd: NonEmptyArray<D>,
        _ f: @escaping (A, B, C, D) -> Element
    ) -> NonEmptyArray<Element> {
        NonEmptyArray<(A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    static func map<A, B, C, D, E>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ fd: NonEmptyArray<D>,
        _ fe: NonEmptyArray<E>,
        _ f: @escaping (A, B, C, D, E) -> Element
    ) -> NonEmptyArray<Element> {
        NonEmptyArray<(A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
    }
    
    static func map<A, B, C, D, E, F>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ fd: NonEmptyArray<D>,
        _ fe: NonEmptyArray<E>,
        _ ff: NonEmptyArray<F>,
        _ f: @escaping (A, B, C, D, E, F) -> Element
    ) -> NonEmptyArray<Element> {
        NonEmptyArray<(A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
    }
    
    static func map<A, B, C, D, E, F, G>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ fd: NonEmptyArray<D>,
        _ fe: NonEmptyArray<E>,
        _ ff: NonEmptyArray<F>,
        _ fg: NonEmptyArray<G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Element
    ) -> NonEmptyArray<Element> {
        NonEmptyArray<(A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ fd: NonEmptyArray<D>,
        _ fe: NonEmptyArray<E>,
        _ ff: NonEmptyArray<F>,
        _ fg: NonEmptyArray<G>,
        _ fh: NonEmptyArray<H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Element
    ) -> NonEmptyArray<Element> {
        NonEmptyArray<(A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H, I>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ fd: NonEmptyArray<D>,
        _ fe: NonEmptyArray<E>,
        _ ff: NonEmptyArray<F>,
        _ fg: NonEmptyArray<G>,
        _ fh: NonEmptyArray<H>,
        _ fi: NonEmptyArray<I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Element
    ) -> NonEmptyArray<Element> {
        NonEmptyArray<(A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    func ap<A, B>(_ fa: NonEmptyArray<A>) -> NonEmptyArray<B> where Element == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    func zipElement<B>(_ fb: NonEmptyArray<B>) -> NonEmptyArray<B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: NonEmptyArray<B>) -> NonEmptyArray<Element> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
