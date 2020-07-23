/// Eval is a data type that describes a potentially lazy computation that produces a value.
///
/// Eval has three different evaluation strategies:
///     - Now: the computation is evaluated immediately.
///     - Later: the computation is evaluated when it is needed (typically by calling `Eval.value()`), just once. This value is cached, so subsequent invocations do not trigger additional computations of the value.
///     - Always: the computation is evaluated every time it is needed (typically by calling `Eval.value()`).
///
/// Now is an eager evaluation strategy, whereas Later and Always are lazy.
public class Eval<Value> {
    /// Creates an Eval value with a value that is immediately evaluated.
    ///
    /// - Parameter a: Value to be wrapped in the Eval.
    /// - Returns: An Eval value.
    public static func now(_ a: Value) -> Eval<Value> {
        Now<Value>(a)
    }

    /// Creates an Eval value that will be evaluated using the Later evaluation strategy.
    ///
    /// - Parameter f: Function producing the value to be wrapped in an Eval.
    /// - Returns: An Eval value.
    public static func later(_ f: @escaping () -> Value) -> Eval<Value> {
        Later<Value>(f)
    }

    /// Creates an Eval value that will be evaluated using the Always evaluation strategy.
    ///
    /// - Parameter f: Function producing the value to be wrapped in an Eval.
    /// - Returns: An Eval value.
    public static func always(_ f: @escaping () -> Value) -> Eval<Value> {
        Always<Value>(f)
    }

    /// Creates an Eval value that defers a computation that produces another Eval.
    ///
    /// - Parameter f: Function producing an Eval.
    /// - Returns: An Eval value.
    public static func `defer`(_ f: @escaping () -> Eval<Value>) -> Eval<Value> {
        Defer<Value>(f)
    }

    /// Computes the value wrapped in this Eval.
    ///
    /// - Returns: Value wrapped in this Eval.
    public func value() -> Value {
        _value().run()
    }
    
    internal func _value() -> Trampoline<Value> {
        fatalError("Must be implemented by subclass")
    }

    /// Provides an Eval that memoizes the result of its enclosed computation.
    ///
    /// - Returns: An Eval value.
    public func memoize() -> Eval<Value> {
        fatalError("Must be implemented by subclass")
    }
}

public extension Eval where Value == Void {
    /// Provides a unit in an Eval.
    static var unit: Eval<Void> {
        Now<Void>(())
    }
}

public extension Eval where Value == Bool {
    /// Provides a true value in an Eval.
    static var `true`: Eval<Bool> {
        Now<Bool>(true)
    }
    
    /// Provides a false value in an Eval.
    static var `false`: Eval<Bool> {
        Now<Bool>(false)
    }
}

public extension Eval where Value == Int {
    /// Provides a zero value in an Eval.
    static var zero: Eval<Int> {
        Now<Int>(0)
    }
    
    /// Provides a one value in an Eval.
    static var one: Eval<Int> {
        Now<Int>(1)
    }
}

private class Now<Value>: Eval<Value> {
    private let a: Value

    init(_ a: Value) {
        self.a = a
    }

    override func _value() -> Trampoline<Value> {
        .done(a)
    }

    override func memoize() -> Eval<Value> {
        self
    }
}

private class Later<Value>: Eval<Value> {
    private lazy var a: Value = f()
    private let f: () -> Value

    init(_ f: @escaping () -> Value) {
        self.f = f
    }

    override func _value() -> Trampoline<Value> {
        .done(a)
    }

    override func memoize() -> Eval<Value> {
        self
    }
}

private class Always<Value>: Eval<Value> {
    private let f: () -> Value

    init(_ f: @escaping () -> Value) {
        self.f = f
    }

    override func _value() -> Trampoline<Value> {
        .later(f)
    }

    override func memoize() -> Eval<Value> {
        Eval<Value>.later(f)
    }
}

private class Defer<Value>: Eval<Value> {
    private let thunk: () -> Eval<Value>

    init(_ thunk: @escaping () -> Eval<Value>) {
        self.thunk = thunk
    }

    override func memoize() -> Eval<Value> {
        Eval<Value>.later(value)
    }

    override func _value() -> Trampoline<Value> {
        .defer { self.thunk()._value() }
    }
}

private class EvalFMap<Value, B>: Eval<B> {
    private let eval: Eval<Value>
    private let f: (Value) -> B
    
    init(_ eval: Eval<Value>, _ f: @escaping (Value) -> B) {
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

private class Bind<Value, B>: Eval<B> {
    private let eval: Eval<Value>
    private let f: (Value) -> Eval<B>
    
    init(_ eval: Eval<Value>, _ f: @escaping (Value) -> Eval<B>) {
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
    func map<B>(_ f: @escaping (Value) -> B) -> Eval<B> {
        EvalFMap(self, f)
    }
}

public extension Eval {
    static func pure(_ a: Value) -> Eval<Value> {
        Eval.now(a)
    }
}

public extension Eval {
    func flatMap<B>(_ f: @escaping (Value) -> Eval<B>) -> Eval<B> {
        Bind(self, f)
    }
}

public extension Eval {
    func coflatMap<B>(_ f: @escaping (Eval<Value>) -> B) -> Eval<B> {
        Eval<B>.later { f(self) }
    }
    
    func extract(_ fa: Eval<Value>) -> Value {
        self.value()
    }
}

extension Eval: Equatable where Value: Equatable {
    public static func ==(lhs: Eval<Value>, rhs: Eval<Value>) -> Bool {
        lhs.value() == rhs.value()
    }
}
