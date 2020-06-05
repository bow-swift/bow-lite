public extension Array {
    static func pure(_ element: Element) -> Array<Element> {
        [element]
    }
    
    static func zip<A, B>(
        _ fa: Array<A>,
        _ fb: Array<B>
    ) -> Array<(A, B)> where Element == (A, B) {
        fa.flatMap { a in
            fb.map { b in (a, b) }
        }
    }
    
    static func zip<A, B, C>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ fc: Array<C>
    ) -> Array<(A, B, C)> where Element == (A, B, C) {
        map(Array<(A, B)>.zip(fa, fb), fc) { x, y in
            (x.0, x.1, y)
        }
    }
    
    static func zip<A, B, C, D>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ fc: Array<C>,
        _ fd: Array<D>
    ) -> Array<(A, B, C, D)> where Element == (A, B, C, D) {
        map(Array<(A, B, C)>.zip(fa, fb, fc), fd) { x, y in
            (x.0, x.1, x.2, y)
        }
    }
    
    static func zip<A, B, C, D, E>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ fc: Array<C>,
        _ fd: Array<D>,
        _ fe: Array<E>
    ) -> Array<(A, B, C, D, E)> where Element == (A, B, C, D, E) {
        map(Array<(A, B, C, D)>.zip(fa, fb, fc, fd), fe) { x, y in
            (x.0, x.1, x.2, x.3, y)
        }
    }
    
    static func zip<A, B, C, D, E, F>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ fc: Array<C>,
        _ fd: Array<D>,
        _ fe: Array<E>,
        _ ff: Array<F>
    ) -> Array<(A, B, C, D, E, F)> where Element == (A, B, C, D, E, F) {
        map(Array<(A, B, C, D, E)>.zip(fa, fb, fc, fd, fe), ff) { x, y in
            (x.0, x.1, x.2, x.3, x.4, y)
        }
    }
    
    static func zip<A, B, C, D, E, F, G>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ fc: Array<C>,
        _ fd: Array<D>,
        _ fe: Array<E>,
        _ ff: Array<F>,
        _ fg: Array<G>
    ) -> Array<(A, B, C, D, E, F, G)> where Element == (A, B, C, D, E, F, G) {
        map(Array<(A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff), fg) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, y)
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ fc: Array<C>,
        _ fd: Array<D>,
        _ fe: Array<E>,
        _ ff: Array<F>,
        _ fg: Array<G>,
        _ fh: Array<H>
    ) -> Array<(A, B, C, D, E, F, G, H)> where Element == (A, B, C, D, E, F, G, H) {
        map(Array<(A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg), fh) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, x.6, y)
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H, I>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ fc: Array<C>,
        _ fd: Array<D>,
        _ fe: Array<E>,
        _ ff: Array<F>,
        _ fg: Array<G>,
        _ fh: Array<H>,
        _ fi: Array<I>
    ) -> Array<(A, B, C, D, E, F, G, H, I)> where Element == (A, B, C, D, E, F, G, H, I) {
        map(Array<(A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh), fi) { x, y in
            (x.0, x.1, x.2, x.3, x.4, x.5, x.6, x.7, y)
        }
    }
    
    static func map<A, B>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ f: @escaping (A, B) -> Element
    ) -> Array<Element> {
        Array<(A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ fc: Array<C>,
        _ f: @escaping (A, B, C) -> Element
    ) -> Array<Element> {
        Array<(A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ fc: Array<C>,
        _ fd: Array<D>,
        _ f: @escaping (A, B, C, D) -> Element
    ) -> Array<Element> {
        Array<(A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    static func map<A, B, C, D, E>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ fc: Array<C>,
        _ fd: Array<D>,
        _ fe: Array<E>,
        _ f: @escaping (A, B, C, D, E) -> Element
    ) -> Array<Element> {
        Array<(A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
    }
    
    static func map<A, B, C, D, E, F>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ fc: Array<C>,
        _ fd: Array<D>,
        _ fe: Array<E>,
        _ ff: Array<F>,
        _ f: @escaping (A, B, C, D, E, F) -> Element
    ) -> Array<Element> {
        Array<(A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
    }
    
    static func map<A, B, C, D, E, F, G>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ fc: Array<C>,
        _ fd: Array<D>,
        _ fe: Array<E>,
        _ ff: Array<F>,
        _ fg: Array<G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Element
    ) -> Array<Element> {
        Array<(A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ fc: Array<C>,
        _ fd: Array<D>,
        _ fe: Array<E>,
        _ ff: Array<F>,
        _ fg: Array<G>,
        _ fh: Array<H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Element
    ) -> Array<Element> {
        Array<(A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H, I>(
        _ fa: Array<A>,
        _ fb: Array<B>,
        _ fc: Array<C>,
        _ fd: Array<D>,
        _ fe: Array<E>,
        _ ff: Array<F>,
        _ fg: Array<G>,
        _ fh: Array<H>,
        _ fi: Array<I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Element
    ) -> Array<Element> {
        Array<(A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    func ap<A, B>(_ fa: Array<A>) -> Array<B> where Element == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    func zipElement<B>(_ fb: Array<B>) -> Array<B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: Array<B>) -> Array<Element> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
