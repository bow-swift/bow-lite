import Foundation

// MARK: Utilities for Monad comprehensions and effects
/// Shiftes the execution to a given queue.
///
/// - Parameter queue: Queue where to run the effects from that point on.
/// - Returns: A binding expression to be used in a Monad comprehension.
public func continueOn<Dependencies, Failure: Error>(_ queue: DispatchQueue) -> EnvIOBindingExpression<Dependencies, Failure> {
    EnvIOBoundVar<Dependencies, Failure, Void>.make() <- EnvIO.lazy().continueOn(queue)
}

/// Runs 2 computations in parallel and tuples their results.
///
/// - Parameters:
///   - fa: 1st computation.
///   - fb: 2nd computation.
/// - Returns: A computation that describes the parallel execution.
public func parallel<Dependencies, Failure: Error, A, B>(
    _ fa: EnvIO<Dependencies, Failure, A>,
    _ fb: EnvIO<Dependencies, Failure, B>) -> EnvIO<Dependencies, Failure, (A, B)> {
    EnvIO.parZip(fa, fb)
}

/// Runs 3 computations in parallel and tuples their results.
///
/// - Parameters:
///   - fa: 1st computation.
///   - fb: 2nd computation.
///   - fc: 3rd computation.
/// - Returns: A computation that describes the parallel execution.
public func parallel<Dependencies, Failure: Error, A, B, C>(
    _ fa: EnvIO<Dependencies, Failure, A>,
    _ fb: EnvIO<Dependencies, Failure, B>,
    _ fc: EnvIO<Dependencies, Failure, C>) -> EnvIO<Dependencies, Failure, (A, B, C)> {
    EnvIO.parZip(fa, fb, fc)
}

/// Runs 4 computations in parallel and tuples their results.
///
/// - Parameters:
///   - fa: 1st computation.
///   - fb: 2nd computation.
///   - fc: 3rd computation.
///   - fd: 4th computation.
/// - Returns: A computation that describes the parallel execution.
public func parallel<Dependencies, Failure: Error, A, B, C, D>(
    _ fa: EnvIO<Dependencies, Failure, A>,
    _ fb: EnvIO<Dependencies, Failure, B>,
    _ fc: EnvIO<Dependencies, Failure, C>,
    _ fd: EnvIO<Dependencies, Failure, D>) -> EnvIO<Dependencies, Failure, (A, B, C, D)> {
    EnvIO.parZip(fa, fb, fc, fd)
}

/// Runs 5 computations in parallel and tuples their results.
///
/// - Parameters:
///   - fa: 1st computation.
///   - fb: 2nd computation.
///   - fc: 3rd computation.
///   - fd: 4th computation.
///   - fe: 5th computation.
/// - Returns: A computation that describes the parallel execution.
public func parallel<Dependencies, Failure: Error, A, B, C, D, E>(
    _ fa: EnvIO<Dependencies, Failure, A>,
    _ fb: EnvIO<Dependencies, Failure, B>,
    _ fc: EnvIO<Dependencies, Failure, C>,
    _ fd: EnvIO<Dependencies, Failure, D>,
    _ fe: EnvIO<Dependencies, Failure, E>) -> EnvIO<Dependencies, Failure, (A, B, C, D, E)> {
    EnvIO.parZip(fa, fb, fc, fd, fe)
}

/// Runs 6 computations in parallel and tuples their results.
///
/// - Parameters:
///   - fa: 1st computation.
///   - fb: 2nd computation.
///   - fc: 3rd computation.
///   - fd: 4th computation.
///   - fe: 5th computation.
///   - fg: 6th computation.
/// - Returns: A computation that describes the parallel execution.
public func parallel<Dependencies, Failure: Error, A, B, C, D, E, G>(
    _ fa: EnvIO<Dependencies, Failure, A>,
    _ fb: EnvIO<Dependencies, Failure, B>,
    _ fc: EnvIO<Dependencies, Failure, C>,
    _ fd: EnvIO<Dependencies, Failure, D>,
    _ fe: EnvIO<Dependencies, Failure, E>,
    _ fg: EnvIO<Dependencies, Failure, G>) -> EnvIO<Dependencies, Failure, (A, B, C, D, E, G)> {
    EnvIO.parZip(fa, fb, fc, fd, fe, fg)
}

/// Runs 7 computations in parallel and tuples their results.
///
/// - Parameters:
///   - fa: 1st computation.
///   - fb: 2nd computation.
///   - fc: 3rd computation.
///   - fd: 4th computation.
///   - fe: 5th computation.
///   - fg: 6th computation.
///   - fh: 7th computation.
/// - Returns: A computation that describes the parallel execution.
public func parallel<Dependencies, Failure: Error, A, B, C, D, E, G, H>(
    _ fa: EnvIO<Dependencies, Failure, A>,
    _ fb: EnvIO<Dependencies, Failure, B>,
    _ fc: EnvIO<Dependencies, Failure, C>,
    _ fd: EnvIO<Dependencies, Failure, D>,
    _ fe: EnvIO<Dependencies, Failure, E>,
    _ fg: EnvIO<Dependencies, Failure, G>,
    _ fh: EnvIO<Dependencies, Failure, H>) -> EnvIO<Dependencies, Failure, (A, B, C, D, E, G, H)> {
    EnvIO.parZip(fa, fb, fc, fd, fe, fg, fh)
}

/// Runs 8 computations in parallel and tuples their results.
///
/// - Parameters:
///   - fa: 1st computation.
///   - fb: 2nd computation.
///   - fc: 3rd computation.
///   - fd: 4th computation.
///   - fe: 5th computation.
///   - fg: 6th computation.
///   - fh: 7th computation.
///   - fi: 8th computation.
/// - Returns: A computation that describes the parallel execution.
public func parallel<Dependencies, Failure: Error, A, B, C, D, E, G, H, I>(
    _ fa: EnvIO<Dependencies, Failure, A>,
    _ fb: EnvIO<Dependencies, Failure, B>,
    _ fc: EnvIO<Dependencies, Failure, C>,
    _ fd: EnvIO<Dependencies, Failure, D>,
    _ fe: EnvIO<Dependencies, Failure, E>,
    _ fg: EnvIO<Dependencies, Failure, G>,
    _ fh: EnvIO<Dependencies, Failure, H>,
    _ fi: EnvIO<Dependencies, Failure, I>) -> EnvIO<Dependencies, Failure, (A, B, C, D, E, G, H, I)> {
    EnvIO.parZip(fa, fb, fc, fd, fe, fg, fh, fi)
}

/// Runs 9 computations in parallel and tuples their results.
///
/// - Parameters:
///   - fa: 1st computation.
///   - fb: 2nd computation.
///   - fc: 3rd computation.
///   - fd: 4th computation.
///   - fe: 5th computation.
///   - fg: 6th computation.
///   - fh: 7th computation.
///   - fi: 8th computation.
///   - fj: 9th computation.
/// - Returns: A computation that describes the parallel execution.
public func parallel<Dependencies, Failure: Error, A, B, C, D, E, G, H, I, J>(
    _ fa: EnvIO<Dependencies, Failure, A>,
    _ fb: EnvIO<Dependencies, Failure, B>,
    _ fc: EnvIO<Dependencies, Failure, C>,
    _ fd: EnvIO<Dependencies, Failure, D>,
    _ fe: EnvIO<Dependencies, Failure, E>,
    _ fg: EnvIO<Dependencies, Failure, G>,
    _ fh: EnvIO<Dependencies, Failure, H>,
    _ fi: EnvIO<Dependencies, Failure, I>,
    _ fj: EnvIO<Dependencies, Failure, J>) -> EnvIO<Dependencies, Failure, (A, B, C, D, E, G, H, I, J)> {
    EnvIO.parZip(fa, fb, fc, fd, fe, fg, fh, fi, fj)
}
