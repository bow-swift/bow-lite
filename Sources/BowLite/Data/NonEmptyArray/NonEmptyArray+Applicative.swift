public extension NonEmptyArray {
    /// Lifts a value to the this context type.
    ///
    /// - Parameter element: Value to be lifted.
    /// - Returns: Provided value in this context type.
    static func pure(_ element: Element) -> NonEmptyArray<Element> {
        NEA(element)
    }
    
    /// Creates a tuple out of two values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>
    ) -> NonEmptyArray<(A, B)> where Element == (A, B) {
        fa.flatMap { a in
            fb.map { b in (a, b) }
        }
    }
    
    /// Creates a tuple out of three values in this context.
    ///
    /// - Parameters:
    ///   - fa: 1st value of the tuple.
    ///   - fb: 2nd value of the tuple.
    ///   - fc: 3rd value of the tuple.
    /// - Returns: A tuple in this context.
    static func zip<A, B, C>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>
    ) -> NonEmptyArray<(A, B, C)> where Element == (A, B, C) {
        map(NonEmptyArray<(A, B)>.zip(fa, fb), fc) { x, y in
            (x.0, x.1, y)
        }
    }
    
    /// Creates a tuple out of four values in this context.
    ///
    /// - Parameters:
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    /// - Returns: A tuple in this context.
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
    
    /// Creates a tuple out of five values in this context.
    ///
    /// - Parameters:
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    ///   - e: 5th value of the tuple.
    /// - Returns: A tuple in this context.
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
    
    /// Creates a tuple out of six values in this context.
    ///
    /// - Parameters:
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    ///   - e: 5th value of the tuple.
    ///   - f: 6th value of the tuple.
    /// - Returns: A tuple in this context.
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
    
    /// Creates a tuple out of seven values in this context.
    ///
    /// - Parameters:
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    ///   - e: 5th value of the tuple.
    ///   - f: 6th value of the tuple.
    ///   - g: 7th value of the tuple.
    /// - Returns: A tuple in this context.
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
    
    /// Creates a tuple out of eight values in this context.
    ///
    /// - Parameters:
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    ///   - e: 5th value of the tuple.
    ///   - f: 6th value of the tuple.
    ///   - g: 7th value of the tuple.
    ///   - h: 8th value of the tuple.
    /// - Returns: A tuple in this context.
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
    
    /// Creates a tuple out of nine values in this context.
    ///
    /// - Parameters:
    ///   - a: 1st value of the tuple.
    ///   - b: 2nd value of the tuple.
    ///   - c: 3rd value of the tuple.
    ///   - d: 4th value of the tuple.
    ///   - e: 5th value of the tuple.
    ///   - f: 6th value of the tuple.
    ///   - g: 7th value of the tuple.
    ///   - h: 8th value of the tuple.
    ///   - i: 9th value of the tuple.
    /// - Returns: A tuple in this context.
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
    
    /// Combines the result of two computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
    static func map<A, B>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ f: @escaping (A, B) -> Element
    ) -> NonEmptyArray<Element> {
        NonEmptyArray<(A, B)>.zip(fa, fb).map(f)
    }
    
    /// Combines the result of three computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
    static func map<A, B, C>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ f: @escaping (A, B, C) -> Element
    ) -> NonEmptyArray<Element> {
        NonEmptyArray<(A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    /// Combines the result of four computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
    static func map<A, B, C, D>(
        _ fa: NonEmptyArray<A>,
        _ fb: NonEmptyArray<B>,
        _ fc: NonEmptyArray<C>,
        _ fd: NonEmptyArray<D>,
        _ f: @escaping (A, B, C, D) -> Element
    ) -> NonEmptyArray<Element> {
        NonEmptyArray<(A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    /// Combines the result of five computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
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
    
    /// Combines the result of six computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    ///   - ff: 6th computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
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
    
    /// Combines the result of seven computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    ///   - ff: 6th computation.
    ///   - fg: 7th computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
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
    
    /// Combines the result of eight computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    ///   - ff: 6th computation.
    ///   - fg: 7th computation.
    ///   - fh: 8th computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
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
    
    /// Combines the result of nine computations in this context, using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - fd: 4th computation.
    ///   - fe: 5th computation.
    ///   - ff: 6th computation.
    ///   - fg: 7th computation.
    ///   - fh: 8th computation.
    ///   - fi: 9th computation.
    ///   - f: Combination function.
    /// - Returns: Result of combining the provided computations, in this context.
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
    
    /// Sequential application.
    ///
    /// - Parameters:
    ///   - fa: A value in the context implementing this instance.
    /// - Returns: A value in this context, resulting from the transformation of the contained original value with the contained function.
    func ap<A, B>(_ fa: NonEmptyArray<A>) -> NonEmptyArray<B> where Element == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the first.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result of running the second computation after the first one.
    func zipRight<B>(_ fb: NonEmptyArray<B>) -> NonEmptyArray<B> {
        .map(self, fb) { _, b in b }
    }
    
    /// Sequentially compose two computations, discarding the value produced by the second.
    ///
    /// - Parameters:
    ///   - fb: 2nd computation.
    /// - Returns: Result produced from the first computation after both are computed.
    func zipLeft<B>(_ fb: NonEmptyArray<B>) -> NonEmptyArray<Element> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
