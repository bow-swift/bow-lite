import BowLiteCore
import BowLiteEffects

infix operator <-- : AssignmentPrecedence

/// Creates a binding expression.
///
/// - Parameters:
///   - bound: Variable to be bound in the expression.
///   - fa: Monadic effect.
/// - Returns: A binding expression.
public func <--<Failure: Error, A>(
    _ bound: IOBoundVar<Failure, A>,
    _ fa: @autoclosure @escaping () -> IO<Failure, A>) -> IOBindingExpression<Failure> {
    bound <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 2-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Failure: Error, A, B>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>),
    _ fa: @autoclosure @escaping () -> IO<Failure, (A, B)>) -> IOBindingExpression<Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 3-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Failure: Error, A, B, C>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>),
    _ fa: @autoclosure @escaping () -> IO<Failure, (A, B, C)>) -> IOBindingExpression<Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 4-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Failure: Error, A, B, C, D>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>, IOBoundVar<Failure, D>),
    _ fa: @autoclosure @escaping () -> IO<Failure, (A, B, C, D)>) -> IOBindingExpression<Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 5-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Failure: Error, A, B, C, D, E>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>, IOBoundVar<Failure, D>, IOBoundVar<Failure, E>),
    _ fa: @autoclosure @escaping () -> IO<Failure, (A, B, C, D, E)>) -> IOBindingExpression<Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 6-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Failure: Error, A, B, C, D, E, G>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>, IOBoundVar<Failure, D>, IOBoundVar<Failure, E>, IOBoundVar<Failure, G>),
    _ fa: @autoclosure @escaping () -> IO<Failure, (A, B, C, D, E, G)>) -> IOBindingExpression<Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 7-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Failure: Error, A, B, C, D, E, G, H>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>, IOBoundVar<Failure, D>, IOBoundVar<Failure, E>, IOBoundVar<Failure, G>, IOBoundVar<Failure, H>),
    _ fa: @autoclosure @escaping () -> IO<Failure, (A, B, C, D, E, G, H)>) -> IOBindingExpression<Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 8-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Failure: Error, A, B, C, D, E, G, H, I>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>, IOBoundVar<Failure, D>, IOBoundVar<Failure, E>, IOBoundVar<Failure, G>, IOBoundVar<Failure, H>, IOBoundVar<Failure, I>),
    _ fa: @autoclosure @escaping () -> IO<Failure, (A, B, C, D, E, G, H, I)>) -> IOBindingExpression<Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 9-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Failure: Error, A, B, C, D, E, G, H, I, J>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>, IOBoundVar<Failure, D>, IOBoundVar<Failure, E>, IOBoundVar<Failure, G>, IOBoundVar<Failure, H>, IOBoundVar<Failure, I>, IOBoundVar<Failure, J>),
    _ fa: @autoclosure @escaping () -> IO<Failure, (A, B, C, D, E, G, H, I, J)>) -> IOBindingExpression<Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 10-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Failure: Error, A, B, C, D, E, G, H, I, J, K>(
    _ bounds: (IOBoundVar<Failure, A>, IOBoundVar<Failure, B>, IOBoundVar<Failure, C>, IOBoundVar<Failure, D>, IOBoundVar<Failure, E>, IOBoundVar<Failure, G>, IOBoundVar<Failure, H>, IOBoundVar<Failure, I>, IOBoundVar<Failure, J>, IOBoundVar<Failure, K>),
    _ fa: @autoclosure @escaping () -> IO<Failure, (A, B, C, D, E, G, H, I, J, K)>) -> IOBindingExpression<Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bound: Variable to be bound in the expression.
///   - fa: Monadic effect.
/// - Returns: A binding expression.
public func <--<Dependencies, Failure: Error, A>(
    _ bound: EnvIOBoundVar<Dependencies, Failure, A>,
    _ fa: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, A>) -> EnvIOBindingExpression<Dependencies, Failure> {
    bound <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 2-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Dependencies, Failure: Error, A, B>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>),
    _ fa: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B)>) -> EnvIOBindingExpression<Dependencies, Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 3-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Dependencies, Failure: Error, A, B, C>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>),
    _ fa: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C)>) -> EnvIOBindingExpression<Dependencies, Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 4-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Dependencies, Failure: Error, A, B, C, D>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>, EnvIOBoundVar<Dependencies, Failure, D>),
    _ fa: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C, D)>) -> EnvIOBindingExpression<Dependencies, Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 5-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Dependencies, Failure: Error, A, B, C, D, E>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>, EnvIOBoundVar<Dependencies, Failure, D>, EnvIOBoundVar<Dependencies, Failure, E>),
    _ fa: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C, D, E)>) -> EnvIOBindingExpression<Dependencies, Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 6-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Dependencies, Failure: Error, A, B, C, D, E, G>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>, EnvIOBoundVar<Dependencies, Failure, D>, EnvIOBoundVar<Dependencies, Failure, E>, EnvIOBoundVar<Dependencies, Failure, G>),
    _ fa: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C, D, E, G)>) -> EnvIOBindingExpression<Dependencies, Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 7-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Dependencies, Failure: Error, A, B, C, D, E, G, H>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>, EnvIOBoundVar<Dependencies, Failure, D>, EnvIOBoundVar<Dependencies, Failure, E>, EnvIOBoundVar<Dependencies, Failure, G>, EnvIOBoundVar<Dependencies, Failure, H>),
    _ fa: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C, D, E, G, H)>) -> EnvIOBindingExpression<Dependencies, Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 8-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Dependencies, Failure: Error, A, B, C, D, E, G, H, I>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>, EnvIOBoundVar<Dependencies, Failure, D>, EnvIOBoundVar<Dependencies, Failure, E>, EnvIOBoundVar<Dependencies, Failure, G>, EnvIOBoundVar<Dependencies, Failure, H>, EnvIOBoundVar<Dependencies, Failure, I>),
    _ fa: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C, D, E, G, H, I)>) -> EnvIOBindingExpression<Dependencies, Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 9-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Dependencies, Failure: Error, A, B, C, D, E, G, H, I, J>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>, EnvIOBoundVar<Dependencies, Failure, D>, EnvIOBoundVar<Dependencies, Failure, E>, EnvIOBoundVar<Dependencies, Failure, G>, EnvIOBoundVar<Dependencies, Failure, H>, EnvIOBoundVar<Dependencies, Failure, I>, EnvIOBoundVar<Dependencies, Failure, J>),
    _ fa: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C, D, E, G, H, I, J)>) -> EnvIOBindingExpression<Dependencies, Failure> {
    bounds <- fa()
}

/// Creates a binding expression.
///
/// - Parameters:
///   - bounds: A 10-ary tuple of variables to be bound to the values produced by the effect.
///   - fa: Monadic effect.
/// - Returns: A binding expresssion.
public func <--<Dependencies, Failure: Error, A, B, C, D, E, G, H, I, J, K>(
    _ bounds: (EnvIOBoundVar<Dependencies, Failure, A>, EnvIOBoundVar<Dependencies, Failure, B>, EnvIOBoundVar<Dependencies, Failure, C>, EnvIOBoundVar<Dependencies, Failure, D>, EnvIOBoundVar<Dependencies, Failure, E>, EnvIOBoundVar<Dependencies, Failure, G>, EnvIOBoundVar<Dependencies, Failure, H>, EnvIOBoundVar<Dependencies, Failure, I>, EnvIOBoundVar<Dependencies, Failure, J>, EnvIOBoundVar<Dependencies, Failure, K>),
    _ fa: @autoclosure @escaping () -> EnvIO<Dependencies, Failure, (A, B, C, D, E, G, H, I, J, K)>) -> EnvIOBindingExpression<Dependencies, Failure> {
    bounds <- fa()
}
