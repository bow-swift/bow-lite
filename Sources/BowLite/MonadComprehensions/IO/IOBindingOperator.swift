internal func erased<Failure: Error, Value>(_ io: IO<Failure, Value>) -> IO<Failure, Any> {
    io.map(id)
}

public func <-<Failure: Error, Value>(
    _ bound: IOBoundVar<Failure, Value>,
    _ io: @autoclosure @escaping () -> IO<Failure, Value>
) -> IOBindingExpression<Failure> {
    IOBindingExpression(bound.erased, io >>> erased)
}

public func <-<Failure: Error, A, B>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>),
    _ io: @autoclosure @escaping () -> IO<Failure, (A, B)>
) -> IOBindingExpression<Failure> {
    IOBindingExpression(
        IOBoundVar2(bounds.0, bounds.1).erased,
        io >>> erased)
}

public func <-<Failure: Error, A, B, C>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>),
    _ io: @autoclosure @escaping () -> IO<Failure, (A, B, C)>
) -> IOBindingExpression<Failure> {
    IOBindingExpression(
        IOBoundVar3(bounds.0, bounds.1, bounds.2).erased,
        io >>> erased)
}

public func <-<Failure: Error, A, B, C, D>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>, IOBoundVar<Failure, D>),
    _ io: @autoclosure @escaping () -> IO<Failure, (A, B, C, D)>
) -> IOBindingExpression<Failure> {
    IOBindingExpression(
        IOBoundVar4(bounds.0, bounds.1, bounds.2, bounds.3).erased,
        io >>> erased)
}

public func <-<Failure: Error, A, B, C, D, E>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>, IOBoundVar<Failure, D>, IOBoundVar<Failure, E>),
    _ io: @autoclosure @escaping () -> IO<Failure, (A, B, C, D, E)>
) -> IOBindingExpression<Failure> {
    IOBindingExpression(
        IOBoundVar5(bounds.0, bounds.1, bounds.2, bounds.3, bounds.4).erased,
        io >>> erased)
}

public func <-<Failure: Error, A, B, C, D, E, F>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>, IOBoundVar<Failure, D>, IOBoundVar<Failure, E>, IOBoundVar<Failure, F>),
    _ io: @autoclosure @escaping () -> IO<Failure, (A, B, C, D, E, F)>
) -> IOBindingExpression<Failure> {
    IOBindingExpression(
        IOBoundVar6(bounds.0, bounds.1, bounds.2, bounds.3, bounds.4, bounds.5).erased,
        io >>> erased)
}

public func <-<Failure: Error, A, B, C, D, E, F, G>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>, IOBoundVar<Failure, D>, IOBoundVar<Failure, E>, IOBoundVar<Failure, F>, IOBoundVar<Failure, G>),
    _ io: @autoclosure @escaping () -> IO<Failure, (A, B, C, D, E, F, G)>
) -> IOBindingExpression<Failure> {
    IOBindingExpression(
        IOBoundVar7(bounds.0, bounds.1, bounds.2, bounds.3, bounds.4, bounds.5, bounds.6).erased,
        io >>> erased)
}

public func <-<Failure: Error, A, B, C, D, E, F, G, H>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>, IOBoundVar<Failure, D>, IOBoundVar<Failure, E>, IOBoundVar<Failure, F>, IOBoundVar<Failure, G>, IOBoundVar<Failure, H>),
    _ io: @autoclosure @escaping () -> IO<Failure, (A, B, C, D, E, F, G, H)>
) -> IOBindingExpression<Failure> {
    IOBindingExpression(
        IOBoundVar8(bounds.0, bounds.1, bounds.2, bounds.3, bounds.4, bounds.5, bounds.6, bounds.7).erased,
        io >>> erased)
}

public func <-<Failure: Error, A, B, C, D, E, F, G, H, I>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>, IOBoundVar<Failure, D>, IOBoundVar<Failure, E>, IOBoundVar<Failure, F>, IOBoundVar<Failure, G>, IOBoundVar<Failure, H>, IOBoundVar<Failure, I>),
    _ io: @autoclosure @escaping () -> IO<Failure, (A, B, C, D, E, F, G, H, I)>
) -> IOBindingExpression<Failure> {
    IOBindingExpression(
        IOBoundVar9(bounds.0, bounds.1, bounds.2, bounds.3, bounds.4, bounds.5, bounds.6, bounds.7, bounds.8).erased,
        io >>> erased)
}

public func <-<Failure: Error, A, B, C, D, E, F, G, H, I, J>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>, IOBoundVar<Failure, D>, IOBoundVar<Failure, E>, IOBoundVar<Failure, F>, IOBoundVar<Failure, G>, IOBoundVar<Failure, H>, IOBoundVar<Failure, I>, IOBoundVar<Failure, J>),
    _ io: @autoclosure @escaping () -> IO<Failure, (A, B, C, D, E, F, G, H, I, J)>
) -> IOBindingExpression<Failure> {
    IOBindingExpression(
        IOBoundVar10(bounds.0, bounds.1, bounds.2, bounds.3, bounds.4, bounds.5, bounds.6, bounds.7, bounds.8, bounds.9).erased,
        io >>> erased)
}
