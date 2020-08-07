import Foundation
import BowLiteCore

class EnvIOMonadComprehension<Dependencies, Failure: Error> {
    static func buildBlock<Value>(
        _ children: [EnvIOBindingExpression<Dependencies, Failure>],
        yield: @escaping () -> Value
    ) -> EnvIO<Dependencies, Failure, Value> {
        if let last = children.last {
            return Array(children.dropLast()).foldRight(
                Eval.always { last.yield(yield) }
            ) { expression, partial in
                Eval.always { expression.bind(partial) }
            }.value()
        } else {
            return .pure(yield())
        }
    }
}

/// Monad comprehension.
///
/// Chains multiple binding expressions in imperative-style syntax by using the `flatMap` operation, and yields a final result.
///
/// - Parameters:
///   - expressions: A variable number of binding expressions.
///   - value: Value to be yield by the monad comprehension.
/// - Returns: An effect resulting from the chaining of all the effects included in this monad comprehension.
public func binding<Dependencies, Failure: Error, Value>(
    _ expressions: EnvIOBindingExpression<Dependencies, Failure>...,
    yield value: @autoclosure @escaping () -> Value
) -> EnvIO<Dependencies, Failure, Value> {
    EnvIOMonadComprehension<Dependencies, Failure>.buildBlock(expressions, yield: value)
}
