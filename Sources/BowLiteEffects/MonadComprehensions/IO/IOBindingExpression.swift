import Foundation
import BowLiteCore

/// A binding expression is one of the instructions of the form `x <- fx` in a monad comprehension.
///
/// In a binding expression of the form `x <- fx`, `x` is the variable to be bound and `fx` is the
/// monadic effect that we want to bind to the variable.
public class IOBindingExpression<Failure: Error> {
    internal let bound: IOBoundVar<Failure, Any>
    internal let fa: () -> IO<Failure, Any>
    
    init(_ bound: IOBoundVar<Failure, Any>, _ fa: @escaping () -> IO<Failure, Any>) {
        self.bound = bound
        self.fa = fa
    }
    
    internal func yield<Value>(_ f: @escaping () -> Value) -> IO<Failure, Value> {
        fa().map { x in
            self.bound.bind(x)
            return f()
        }
    }
    
    internal func bind<Value>(_ partial: Eval<IO<Failure, Value>>) -> IO<Failure, Value> {
        fa().flatMap { x in
            self.bound.bind(x)
            return partial.value()
        }
    }
}
