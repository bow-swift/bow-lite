public extension Const where Constant: Monoid {
    static func pure(_ value: Variable) -> Const<Constant, Variable> {
        Const(.empty)
    }
    
    static func zip<A, B>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>
    ) -> Const<Constant, (A, B)> where Variable == (A, B) {
        Const.combineAll(
            fa.retag(),
            fb.retag()
        )
    }
    
    static func zip<A, B, C>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>
    ) -> Const<Constant, (A, B, C)> where Variable == (A, B, C) {
        Const.combineAll(
            fa.retag(),
            fb.retag(),
            fc.retag()
        )
    }
    
    static func zip<A, B, C, D>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>
    ) -> Const<Constant, (A, B, C, D)> where Variable == (A, B, C, D) {
        Const.combineAll(
            fa.retag(),
            fb.retag(),
            fc.retag(),
            fd.retag()
        )
    }
    
    static func zip<A, B, C, D, E>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>
    ) -> Const<Constant, (A, B, C, D, E)> where Variable == (A, B, C, D, E) {
        Const.combineAll(
            fa.retag(),
            fb.retag(),
            fc.retag(),
            fd.retag(),
            fe.retag()
        )
    }
    
    static func zip<A, B, C, D, E, F>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>
    ) -> Const<Constant, (A, B, C, D, E, F)> where Variable == (A, B, C, D, E, F) {
        Const.combineAll(
            fa.retag(),
            fb.retag(),
            fc.retag(),
            fd.retag(),
            fe.retag(),
            ff.retag()
        )
    }
    
    static func zip<A, B, C, D, E, F, G>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>,
        _ fg: Const<Constant, G>
    ) -> Const<Constant, (A, B, C, D, E, F, G)> where Variable == (A, B, C, D, E, F, G) {
        Const.combineAll(
            fa.retag(),
            fb.retag(),
            fc.retag(),
            fd.retag(),
            fe.retag(),
            ff.retag(),
            fg.retag()
        )
    }
    
    static func zip<A, B, C, D, E, F, G, H>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>,
        _ fg: Const<Constant, G>,
        _ fh: Const<Constant, H>
    ) -> Const<Constant, (A, B, C, D, E, F, G, H)> where Variable == (A, B, C, D, E, F, G, H) {
        Const.combineAll(
            fa.retag(),
            fb.retag(),
            fc.retag(),
            fd.retag(),
            fe.retag(),
            ff.retag(),
            fg.retag(),
            fh.retag()
        )
    }
    
    static func zip<A, B, C, D, E, F, G, H, I>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>,
        _ fg: Const<Constant, G>,
        _ fh: Const<Constant, H>,
        _ fi: Const<Constant, I>
    ) -> Const<Constant, (A, B, C, D, E, F, G, H, I)> where Variable == (A, B, C, D, E, F, G, H, I) {
        Const.combineAll(
            fa.retag(),
            fb.retag(),
            fc.retag(),
            fd.retag(),
            fe.retag(),
            ff.retag(),
            fg.retag(),
            fh.retag(),
            fi.retag()
        )
    }
    
    static func map<A, B>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ f: @escaping (A, B) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ f: @escaping (A, B, C) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ f: @escaping (A, B, C, D) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    static func map<A, B, C, D, E>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ f: @escaping (A, B, C, D, E) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
    }
    
    static func map<A, B, C, D, E, F>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
    }
    
    static func map<A, B, C, D, E, F, G>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>,
        _ fg: Const<Constant, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>,
        _ fg: Const<Constant, G>,
        _ fh: Const<Constant, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H, I>(
        _ fa: Const<Constant, A>,
        _ fb: Const<Constant, B>,
        _ fc: Const<Constant, C>,
        _ fd: Const<Constant, D>,
        _ fe: Const<Constant, E>,
        _ ff: Const<Constant, F>,
        _ fg: Const<Constant, G>,
        _ fh: Const<Constant, H>,
        _ fi: Const<Constant, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Variable
    ) -> Const<Constant, Variable> {
        Const<Constant, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    func ap<A, B>(_ fa: Const<Constant, A>) -> Const<Constant, B> where Variable == (A) -> B {
        self.retag().combine(fa.retag())
    }
    
    func zipVariable<B>(_ fb: Const<Constant, B>) -> Const<Constant, B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: Const<Constant, B>) -> Const<Constant, Variable> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
