import Foundation

/// Shiftes the execution to a given queue.
///
/// - Parameter queue: Queue where to run the effects from that point on.
/// - Returns: A binding expression to be used in a Monad comprehension.
public func continueOn<Failure: Error>(_ queue: DispatchQueue) -> IOBindingExpression<Failure> {
    IOBoundVar<Failure, Void>.make() <- IO.lazy().continueOn(queue)
}

/// Runs 2 computations in parallel and tuples their results.
///
/// - Parameters:
///   - fa: 1st computation.
///   - fb: 2nd computation.
/// - Returns: A computation that describes the parallel execution.
public func parallel<Failure: Error, A, B>(
    _ fa: IO<Failure, A>,
    _ fb: IO<Failure, B>) -> IO<Failure, (A, B)> {
    IO.parZip(fa, fb)
}

/// Runs 3 computations in parallel and tuples their results.
///
/// - Parameters:
///   - fa: 1st computation.
///   - fb: 2nd computation.
///   - fc: 3rd computation.
/// - Returns: A computation that describes the parallel execution.
public func parallel<Failure: Error, A, B, C>(
    _ fa: IO<Failure, A>,
    _ fb: IO<Failure, B>,
    _ fc: IO<Failure, C>) -> IO<Failure, (A, B, C)> {
    IO.parZip(fa, fb, fc)
}

/// Runs 4 computations in parallel and tuples their results.
///
/// - Parameters:
///   - fa: 1st computation.
///   - fb: 2nd computation.
///   - fc: 3rd computation.
///   - fd: 4th computation.
/// - Returns: A computation that describes the parallel execution.
public func parallel<Failure: Error, A, B, C, D>(
    _ fa: IO<Failure, A>,
    _ fb: IO<Failure, B>,
    _ fc: IO<Failure, C>,
    _ fd: IO<Failure, D>) -> IO<Failure, (A, B, C, D)> {
    IO.parZip(fa, fb, fc, fd)
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
public func parallel<Failure: Error, A, B, C, D, E>(
    _ fa: IO<Failure, A>,
    _ fb: IO<Failure, B>,
    _ fc: IO<Failure, C>,
    _ fd: IO<Failure, D>,
    _ fe: IO<Failure, E>) -> IO<Failure, (A, B, C, D, E)> {
    IO.parZip(fa, fb, fc, fd, fe)
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
public func parallel<Failure: Error, A, B, C, D, E, G>(
    _ fa: IO<Failure, A>,
    _ fb: IO<Failure, B>,
    _ fc: IO<Failure, C>,
    _ fd: IO<Failure, D>,
    _ fe: IO<Failure, E>,
    _ fg: IO<Failure, G>) -> IO<Failure, (A, B, C, D, E, G)> {
    IO.parZip(fa, fb, fc, fd, fe, fg)
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
public func parallel<Failure: Error, A, B, C, D, E, G, H>(
    _ fa: IO<Failure, A>,
    _ fb: IO<Failure, B>,
    _ fc: IO<Failure, C>,
    _ fd: IO<Failure, D>,
    _ fe: IO<Failure, E>,
    _ fg: IO<Failure, G>,
    _ fh: IO<Failure, H>) -> IO<Failure, (A, B, C, D, E, G, H)> {
    IO.parZip(fa, fb, fc, fd, fe, fg, fh)
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
public func parallel<Failure: Error, A, B, C, D, E, G, H, I>(
    _ fa: IO<Failure, A>,
    _ fb: IO<Failure, B>,
    _ fc: IO<Failure, C>,
    _ fd: IO<Failure, D>,
    _ fe: IO<Failure, E>,
    _ fg: IO<Failure, G>,
    _ fh: IO<Failure, H>,
    _ fi: IO<Failure, I>) -> IO<Failure, (A, B, C, D, E, G, H, I)> {
    IO.parZip(fa, fb, fc, fd, fe, fg, fh, fi)
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
public func parallel<Failure: Error, A, B, C, D, E, G, H, I, J>(
    _ fa: IO<Failure, A>,
    _ fb: IO<Failure, B>,
    _ fc: IO<Failure, C>,
    _ fd: IO<Failure, D>,
    _ fe: IO<Failure, E>,
    _ fg: IO<Failure, G>,
    _ fh: IO<Failure, H>,
    _ fi: IO<Failure, I>,
    _ fj: IO<Failure, J>) -> IO<Failure, (A, B, C, D, E, G, H, I, J)> {
    IO.parZip(fa, fb, fc, fd, fe, fg, fh, fi, fj)
}
