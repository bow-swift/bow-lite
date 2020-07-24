/// A binding expression is one of the instructions of the form `x <- fx` in a monad comprehension.
///
/// In a binding expression of the form `x <- fx`, `x` is the variable to be bound and `fx` is the
/// monadic effect that we want to bind to the variable.s
public class EnvIOBindingExpression<Dependencies, Failure: Error> {
    internal let bound: EnvIOBoundVar<Dependencies, Failure, Any>
    internal let fa: () -> EnvIO<Dependencies, Failure, Any>
    
    init(_ bound: EnvIOBoundVar<Dependencies, Failure, Any>, _ fa: @escaping () -> EnvIO<Dependencies, Failure, Any>) {
        self.bound = bound
        self.fa = fa
    }
    
    internal func yield<Value>(_ f: @escaping () -> Value) -> EnvIO<Dependencies, Failure, Value> {
        fa().map { x in
            self.bound.bind(x)
            return f()
        }
    }
    
    internal func bind<Value>(_ partial: Eval<EnvIO<Dependencies, Failure, Value>>) -> EnvIO<Dependencies, Failure, Value> {
        fa().flatMap { x in
            self.bound.bind(x)
            return partial.value()
        }
    }
}
