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

public func binding<Dependencies, Failure: Error, Value>(
    _ expressions: EnvIOBindingExpression<Dependencies, Failure>...,
    yield value: @autoclosure @escaping () -> Value
) -> EnvIO<Dependencies, Failure, Value> {
    EnvIOMonadComprehension<Dependencies, Failure>.buildBlock(expressions, yield: value)
}
