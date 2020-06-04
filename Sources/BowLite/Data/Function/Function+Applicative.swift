public extension Function {
    static func pure(_ output: Output) -> Function<Input, Output> {
        Function(constant(output))
    }
    
    static func zip<A, B>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>
    ) -> Function<Input, (A, B)> where Output == (A, B) {
        Function { input in
            (fa(input),
             fb(input))
        }
    }
    
    static func zip<A, B, C>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>
    ) -> Function<Input, (A, B, C)> where Output == (A, B, C) {
        Function { input in
            (fa(input),
             fb(input),
             fc(input))
        }
    }
    
    static func zip<A, B, C, D>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>
    ) -> Function<Input, (A, B, C, D)> where Output == (A, B, C, D) {
        Function { input in
            (fa(input),
             fb(input),
             fc(input),
             fd(input))
        }
    }
    
    static func zip<A, B, C, D, E>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>
    ) -> Function<Input, (A, B, C, D, E)> where Output == (A, B, C, D, E) {
        Function { input in
            (fa(input),
             fb(input),
             fc(input),
             fd(input),
             fe(input))
        }
    }
    
    static func zip<A, B, C, D, E, F>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>
    ) -> Function<Input, (A, B, C, D, E, F)> where Output == (A, B, C, D, E, F) {
        Function { input in
            (fa(input),
             fb(input),
             fc(input),
             fd(input),
             fe(input),
             ff(input))
        }
    }
    
    static func zip<A, B, C, D, E, F, G>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>,
        _ fg: Function<Input, G>
    ) -> Function<Input, (A, B, C, D, E, F, G)> where Output == (A, B, C, D, E, F, G) {
        Function { input in
            (fa(input),
             fb(input),
             fc(input),
             fd(input),
             fe(input),
             ff(input),
             fg(input))
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>,
        _ fg: Function<Input, G>,
        _ fh: Function<Input, H>
    ) -> Function<Input, (A, B, C, D, E, F, G, H)> where Output == (A, B, C, D, E, F, G, H) {
        Function { input in
            (fa(input),
             fb(input),
             fc(input),
             fd(input),
             fe(input),
             ff(input),
             fg(input),
             fh(input))
        }
    }
    
    static func zip<A, B, C, D, E, F, G, H, I>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>,
        _ fg: Function<Input, G>,
        _ fh: Function<Input, H>,
        _ fi: Function<Input, I>
    ) -> Function<Input, (A, B, C, D, E, F, G, H, I)> where Output == (A, B, C, D, E, F, G, H, I) {
        Function { input in
            (fa(input),
             fb(input),
             fc(input),
             fd(input),
             fe(input),
             ff(input),
             fg(input),
             fh(input),
             fi(input))
        }
    }
    
    static func map<A, B>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ f: @escaping (A, B) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B)>.zip(fa, fb).map(f)
    }
    
    static func map<A, B, C>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ f: @escaping (A, B, C) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B, C)>.zip(fa, fb, fc).map(f)
    }
    
    static func map<A, B, C, D>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ f: @escaping (A, B, C, D) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B, C, D)>.zip(fa, fb, fc, fd).map(f)
    }
    
    static func map<A, B, C, D, E>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ f: @escaping (A, B, C, D, E) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B, C, D, E)>.zip(fa, fb, fc, fd, fe).map(f)
    }
    
    static func map<A, B, C, D, E, F>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>,
        _ f: @escaping (A, B, C, D, E, F) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B, C, D, E, F)>.zip(fa, fb, fc, fd, fe, ff).map(f)
    }
    
    static func map<A, B, C, D, E, F, G>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>,
        _ fg: Function<Input, G>,
        _ f: @escaping (A, B, C, D, E, F, G) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B, C, D, E, F, G)>.zip(fa, fb, fc, fd, fe, ff, fg).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>,
        _ fg: Function<Input, G>,
        _ fh: Function<Input, H>,
        _ f: @escaping (A, B, C, D, E, F, G, H) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B, C, D, E, F, G, H)>.zip(fa, fb, fc, fd, fe, ff, fg, fh).map(f)
    }
    
    static func map<A, B, C, D, E, F, G, H, I>(
        _ fa: Function<Input, A>,
        _ fb: Function<Input, B>,
        _ fc: Function<Input, C>,
        _ fd: Function<Input, D>,
        _ fe: Function<Input, E>,
        _ ff: Function<Input, F>,
        _ fg: Function<Input, G>,
        _ fh: Function<Input, H>,
        _ fi: Function<Input, I>,
        _ f: @escaping (A, B, C, D, E, F, G, H, I) -> Output
    ) -> Function<Input, Output> {
        Function<Input, (A, B, C, D, E, F, G, H, I)>.zip(fa, fb, fc, fd, fe, ff, fg, fh, fi).map(f)
    }
    
    func ap<A, B>(_ fa: Function<Input, A>) -> Function<Input, B> where Output == (A) -> B {
        self.flatMap { f in
            fa.map { a in f(a) }
        }
    }
    
    func zipOutput<B>(_ fb: Function<Input, B>) -> Function<Input, B> {
        .map(self, fb) { _, b in b }
    }
    
    func zipLeft<B>(_ fb: Function<Input, B>) -> Function<Input, Output> {
        .map(self, fb) { wrapped, _ in wrapped }
    }
}
