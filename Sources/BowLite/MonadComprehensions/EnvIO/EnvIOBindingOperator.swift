internal func erased<Dependencies, Failure: Error, Value>(_ io: EnvIO<Dependencies, Failure, Value>) -> EnvIO<Dependencies, Failure, Any> {
    io.map(id)
}

public func <-<Dependencies, Failure: Error, Value>(
    _ bound: EnvIOBoundVar<Dependencies, Failure, Value>,
    _ io: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, Value>
) -> EnvIOBindingExpression<Dependencies, Failure> {
    EnvIOBindingExpression(bound.erased, io >>> erased)
}

public func <-<Dependencies, Failure: Error, A, B>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>),
    _ io: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B)>
) -> EnvIOBindingExpression<Dependencies, Failure> {
    EnvIOBindingExpression(
        EnvIOBoundVar2(bounds.0, bounds.1).erased,
        io >>> erased)
}

public func <-<Dependencies, Failure: Error, A, B, C>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>),
    _ io: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C)>
) -> EnvIOBindingExpression<Dependencies, Failure> {
    EnvIOBindingExpression(
        EnvIOBoundVar3(bounds.0, bounds.1, bounds.2).erased,
        io >>> erased)
}

public func <-<Dependencies, Failure: Error, A, B, C, D>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>, EnvIOBoundVar<Dependencies, Failure, D>),
    _ io: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C, D)>
) -> EnvIOBindingExpression<Dependencies, Failure> {
    EnvIOBindingExpression(
        EnvIOBoundVar4(bounds.0, bounds.1, bounds.2, bounds.3).erased,
        io >>> erased)
}

public func <-<Dependencies, Failure: Error, A, B, C, D, E>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>, EnvIOBoundVar<Dependencies, Failure, D>, EnvIOBoundVar<Dependencies, Failure, E>),
    _ io: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C, D, E)>
) -> EnvIOBindingExpression<Dependencies, Failure> {
    EnvIOBindingExpression(
        EnvIOBoundVar5(bounds.0, bounds.1, bounds.2, bounds.3, bounds.4).erased,
        io >>> erased)
}

public func <-<Dependencies, Failure: Error, A, B, C, D, E, F>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>, EnvIOBoundVar<Dependencies, Failure, D>, EnvIOBoundVar<Dependencies, Failure, E>, EnvIOBoundVar<Dependencies, Failure, F>),
    _ io: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C, D, E, F)>
) -> EnvIOBindingExpression<Dependencies, Failure> {
    EnvIOBindingExpression(
        EnvIOBoundVar6(bounds.0, bounds.1, bounds.2, bounds.3, bounds.4, bounds.5).erased,
        io >>> erased)
}

public func <-<Dependencies, Failure: Error, A, B, C, D, E, F, G>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>, EnvIOBoundVar<Dependencies, Failure, D>, EnvIOBoundVar<Dependencies, Failure, E>, EnvIOBoundVar<Dependencies, Failure, F>, EnvIOBoundVar<Dependencies, Failure, G>),
    _ io: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C, D, E, F, G)>
) -> EnvIOBindingExpression<Dependencies, Failure> {
    EnvIOBindingExpression(
        EnvIOBoundVar7(bounds.0, bounds.1, bounds.2, bounds.3, bounds.4, bounds.5, bounds.6).erased,
        io >>> erased)
}

public func <-<Dependencies, Failure: Error, A, B, C, D, E, F, G, H>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>, EnvIOBoundVar<Dependencies, Failure, D>, EnvIOBoundVar<Dependencies, Failure, E>, EnvIOBoundVar<Dependencies, Failure, F>, EnvIOBoundVar<Dependencies, Failure, G>, EnvIOBoundVar<Dependencies, Failure, H>),
    _ io: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C, D, E, F, G, H)>
) -> EnvIOBindingExpression<Dependencies, Failure> {
    EnvIOBindingExpression(
        EnvIOBoundVar8(bounds.0, bounds.1, bounds.2, bounds.3, bounds.4, bounds.5, bounds.6, bounds.7).erased,
        io >>> erased)
}

public func <-<Dependencies, Failure: Error, A, B, C, D, E, F, G, H, I>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>, EnvIOBoundVar<Dependencies, Failure, D>, EnvIOBoundVar<Dependencies, Failure, E>, EnvIOBoundVar<Dependencies, Failure, F>, EnvIOBoundVar<Dependencies, Failure, G>, EnvIOBoundVar<Dependencies, Failure, H>, EnvIOBoundVar<Dependencies, Failure, I>),
    _ io: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C, D, E, F, G, H, I)>
) -> EnvIOBindingExpression<Dependencies, Failure> {
    EnvIOBindingExpression(
        EnvIOBoundVar9(bounds.0, bounds.1, bounds.2, bounds.3, bounds.4, bounds.5, bounds.6, bounds.7, bounds.8).erased,
        io >>> erased)
}

public func <-<Dependencies, Failure: Error, A, B, C, D, E, F, G, H, I, J>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>, EnvIOBoundVar<Dependencies, Failure, D>, EnvIOBoundVar<Dependencies, Failure, E>, EnvIOBoundVar<Dependencies, Failure, F>, EnvIOBoundVar<Dependencies, Failure, G>, EnvIOBoundVar<Dependencies, Failure, H>, EnvIOBoundVar<Dependencies, Failure, I>, EnvIOBoundVar<Dependencies, Failure, J>),
    _ io: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C, D, E, F, G, H, I, J)>
) -> EnvIOBindingExpression<Dependencies, Failure> {
    EnvIOBindingExpression(
        EnvIOBoundVar10(bounds.0, bounds.1, bounds.2, bounds.3, bounds.4, bounds.5, bounds.6, bounds.7, bounds.8, bounds.9).erased,
        io >>> erased)
}
