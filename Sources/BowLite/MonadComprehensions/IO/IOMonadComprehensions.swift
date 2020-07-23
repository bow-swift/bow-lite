class IOMonadComprehension<Failure: Error> {
    static func buildBlock<Value>(
        _ children: [IOBindingExpression<Failure>],
        yield: @escaping () -> Value
    ) -> IO<Failure, Value> {
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

public func binding<Failure: Error, Value>(
    _ expressions: IOBindingExpression<Failure>...,
    yield value: @autoclosure @escaping () -> Value
) -> IO<Failure, Value> {
    IOMonadComprehension<Failure>.buildBlock(expressions, yield: value)
}
