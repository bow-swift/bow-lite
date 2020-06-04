public extension Writer where Accumulator: Monoid {
    static func pure(_ value: Value) -> Writer<Accumulator, Value> {
        Writer(.empty, value)
    }
    
    static func zip<A, B>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>
    ) -> Writer<Accumulator, (A, B)> where Value == (A, B) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator),
            (fa.value, fb.value))
    }
    
    static func zip<A, B, C>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>
    ) -> Writer<Accumulator, (A, B, C)> where Value == (A, B, C) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator,
                fc.accumulator),
            (fa.value, fb.value, fc.value))
    }
    
    static func zip<A, B, C, D>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>
    ) -> Writer<Accumulator, (A, B, C, D)> where Value == (A, B, C, D) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator,
                fc.accumulator,
                fd.accumulator),
            (fa.value, fb.value, fc.value, fd.value))
    }
    
    static func zip<A, B, C, D, E>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>
    ) -> Writer<Accumulator, (A, B, C, D, E)> where Value == (A, B, C, D, E) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator,
                fc.accumulator,
                fd.accumulator,
                fe.accumulator),
            (fa.value, fb.value, fc.value, fd.value, fe.value))
    }
    
    static func zip<A, B, C, D, E, F>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>
    ) -> Writer<Accumulator, (A, B, C, D, E, F)> where Value == (A, B, C, D, E, F) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator,
                fc.accumulator,
                fd.accumulator,
                fe.accumulator,
                ff.accumulator),
            (fa.value, fb.value, fc.value, fd.value, fe.value, ff.value))
    }
    
    static func zip<A, B, C, D, E, F, G>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>,
        _ fg: Writer<Accumulator, G>
    ) -> Writer<Accumulator, (A, B, C, D, E, F, G)> where Value == (A, B, C, D, E, F, G) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator,
                fc.accumulator,
                fd.accumulator,
                fe.accumulator,
                ff.accumulator,
                fg.accumulator),
            (fa.value, fb.value, fc.value, fd.value, fe.value, ff.value, fg.value))
    }
    
    static func zip<A, B, C, D, E, F, G, H>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>,
        _ fg: Writer<Accumulator, G>,
        _ fh: Writer<Accumulator, H>
    ) -> Writer<Accumulator, (A, B, C, D, E, F, G, H)> where Value == (A, B, C, D, E, F, G, H) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator,
                fc.accumulator,
                fd.accumulator,
                fe.accumulator,
                ff.accumulator,
                fg.accumulator,
                fh.accumulator),
            (fa.value, fb.value, fc.value, fd.value, fe.value, ff.value, fg.value, fh.value))
    }
    
    static func zip<A, B, C, D, E, F, G, H, I>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>,
        _ fg: Writer<Accumulator, G>,
        _ fh: Writer<Accumulator, H>,
        _ fi: Writer<Accumulator, I>
    ) -> Writer<Accumulator, (A, B, C, D, E, F, G, H, I)> where Value == (A, B, C, D, E, F, G, H, I) {
        Writer(
            Accumulator.combineAll(
                fa.accumulator,
                fb.accumulator,
                fc.accumulator,
                fd.accumulator,
                fe.accumulator,
                ff.accumulator,
                fg.accumulator,
                fh.accumulator,
                fi.accumulator),
            (fa.value, fb.value, fc.value, fd.value, fe.value, ff.value, fg.value, fh.value, fi.value))
    }
    
    static func map<A, B>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ f: @escaping (A, B) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ f: @escaping (A, B, C) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ f: @escaping (A, B, C, D) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    static func map<A, B, C, D, E>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ f: @escaping (A, B, C, D, E) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
    }
    
    static func map<A, B, C, D, E, F>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
    }
    
    static func map<A, B, C, D, E, F, G>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>,
        _ fg: Writer<Accumulator, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>,
        _ fg: Writer<Accumulator, G>,
        _ fh: Writer<Accumulator, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H, I>(
        _ fa: Writer<Accumulator, A>,
        _ fb: Writer<Accumulator, B>,
        _ fc: Writer<Accumulator, C>,
        _ fd: Writer<Accumulator, D>,
        _ fe: Writer<Accumulator, E>,
        _ ff: Writer<Accumulator, F>,
        _ fg: Writer<Accumulator, G>,
        _ fh: Writer<Accumulator, H>,
        _ fi: Writer<Accumulator, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Value
    ) -> Writer<Accumulator, Value> {
        Writer<Accumulator, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    func ap<A, B>(_ fa: Writer<Accumulator, A>) -> Writer<Accumulator, B> where Value == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    func zipValue<B>(_ fb: Writer<Accumulator, B>) -> Writer<Accumulator, B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: Writer<Accumulator, B>) -> Writer<Accumulator, Value> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
