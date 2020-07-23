/// Eval is a data type that describes a potentially lazy computation that produces a value.
///
/// Eval has three different evaluation strategies:
///     - Now: the computation is evaluated immediately.
///     - Later: the computation is evaluated when it is needed (typically by calling `Eval.value()`), just once. This value is cached, so subsequent invocations do not trigger additional computations of the value.
///     - Always: the computation is evaluated every time it is needed (typically by calling `Eval.value()`).
///
/// Now is an eager evaluation strategy, whereas Later and Always are lazy.
public class Eval<A> {
    /// Creates an Eval value with a value that is immediately evaluated.
    ///
    /// - Parameter a: Value to be wrapped in the Eval.
    /// - Returns: An Eval value.
    public static func now(_ a: A) -> Eval<A> {
        Now<A>(a)
    }

    /// Creates an Eval value that will be evaluated using the Later evaluation strategy.
    ///
    /// - Parameter f: Function producing the value to be wrapped in an Eval.
    /// - Returns: An Eval value.
    public static func later(_ f: @escaping () -> A) -> Eval<A> {
        Later<A>(f)
    }

    /// Creates an Eval value that will be evaluated using the Always evaluation strategy.
    ///
    /// - Parameter f: Function producing the value to be wrapped in an Eval.
    /// - Returns: An Eval value.
    public static func always(_ f: @escaping () -> A) -> Eval<A> {
        Always<A>(f)
    }

    /// Creates an Eval value that defers a computation that produces another Eval.
    ///
    /// - Parameter f: Function producing an Eval.
    /// - Returns: An Eval value.
    public static func `defer`(_ f: @escaping () -> Eval<A>) -> Eval<A> {
        Defer<A>(f)
    }

    /// Computes the value wrapped in this Eval.
    ///
    /// - Returns: Value wrapped in this Eval.
    public func value() -> A {
        _value().run()
    }
    
    internal func _value() -> Trampoline<A> {
        fatalError("Must be implemented by subclass")
    }

    /// Provides an Eval that memoizes the result of its enclosed computation.
    ///
    /// - Returns: An Eval value.
    public func memoize() -> Eval<A> {
        fatalError("Must be implemented by subclass")
    }
}

public extension Eval where A == Void {
    /// Provides a unit in an Eval.
    static var unit: Eval<Void> {
        Now<Void>(())
    }
}

public extension Eval where A == Bool {
    /// Provides a true value in an Eval.
    static var `true`: Eval<Bool> {
        Now<Bool>(true)
    }
    
    /// Provides a false value in an Eval.
    static var `false`: Eval<Bool> {
        Now<Bool>(false)
    }
}

public extension Eval where A == Int {
    /// Provides a zero value in an Eval.
    static var zero: Eval<Int> {
        Now<Int>(0)
    }
    
    /// Provides a one value in an Eval.
    static var one: Eval<Int> {
        Now<Int>(1)
    }
}

private class Now<A>: Eval<A> {
    private let a: A

    init(_ a: A) {
        self.a = a
    }

    override func _value() -> Trampoline<A> {
        .done(a)
    }

    override func memoize() -> Eval<A> {
        self
    }
}

private class Later<A>: Eval<A> {
    private lazy var a: A = f()
    private let f: () -> A

    init(_ f: @escaping () -> A) {
        self.f = f
    }

    override func _value() -> Trampoline<A> {
        .done(a)
    }

    override func memoize() -> Eval<A> {
        self
    }
}

private class Always<A>: Eval<A> {
    private let f: () -> A

    init(_ f: @escaping () -> A) {
        self.f = f
    }

    override func _value() -> Trampoline<A> {
        .later(f)
    }

    override func memoize() -> Eval<A> {
        Eval<A>.later(f)
    }
}

private class Defer<A>: Eval<A> {
    private let thunk: () -> Eval<A>

    init(_ thunk: @escaping () -> Eval<A>) {
        self.thunk = thunk
    }

    override func memoize() -> Eval<A> {
        Eval<A>.later(value)
    }

    override func _value() -> Trampoline<A> {
        .defer { self.thunk()._value() }
    }
}

private class EvalFMap<A, B>: Eval<B> {
    private let eval: Eval<A>
    private let f: (A) -> B
    
    init(_ eval: Eval<A>, _ f: @escaping (A) -> B) {
        self.eval = eval
        self.f = f
    }
    
    override func memoize() -> Eval<B> {
        Eval<B>.later { self.value() }
    }
    
    override func _value() -> Trampoline<B> {
        .later { self.f(self.eval.value()) }
    }
}

private class Bind<A, B>: Eval<B> {
    private let eval: Eval<A>
    private let f: (A) -> Eval<B>
    
    init(_ eval: Eval<A>, _ f: @escaping (A) -> Eval<B>) {
        self.eval = eval
        self.f = f
    }
    
    override func memoize() -> Eval<B> {
        Eval.later { self.value() }
    }
    
    override func _value() -> Trampoline<B> {
        .later { self.f(self.eval.value()).value() }
    }
}

public extension Eval {
    func map<B>(_ f: @escaping (A) -> B) -> Eval<B> {
        EvalFMap(self, f)
    }
}

public extension Eval {
    static func pure(_ a: A) -> Eval<A> {
        Eval.now(a)
    }
}

public extension Eval {
    func flatMap<B>(_ f: @escaping (A) -> Eval<B>) -> Eval<B> {
        Bind(self, f)
    }
}

public extension Eval {
    func coflatMap<B>(_ f: @escaping (Eval<A>) -> B) -> Eval<B> {
        Eval<B>.later { f(self) }
    }
    
    func extract(_ fa: Eval<A>) -> A {
        self.value()
    }
}

extension Eval: Equatable where A: Equatable {
    public static func ==(lhs: Eval<A>, rhs: Eval<A>) -> Bool {
        lhs.value() == rhs.value()
    }
}
