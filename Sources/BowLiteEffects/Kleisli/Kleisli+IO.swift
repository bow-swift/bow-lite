import Foundation
import BowLiteCore

// MARK: Kleisli for IO

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C, D>(
    _ f: @escaping (A) -> IO<D, B>,
    _ g: @escaping (B) -> IO<D, C>
) -> (A) -> IO<D, C> {
    { a in
        f(a).flatMap(g)
    }
}

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func >=><A, B, C, D>(
    _ f: @escaping (A) -> IO<D, B>,
    _ g: @escaping (B) -> IO<D, C>
) -> (A) -> IO<D, C> {
    andThen(f, g)
}

// MARK: Kleisli for EnvIO

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C, D, E>(
    _ f: @escaping (A) -> EnvIO<D, E, B>,
    _ g: @escaping (B) -> EnvIO<D, E, C>
) -> (A) -> EnvIO<D, E, C> {
    { a in
        f(a).flatMap(g)
    }
}

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func >=><A, B, C, D, E>(
    _ f: @escaping (A) -> EnvIO<D, E, B>,
    _ g: @escaping (B) -> EnvIO<D, E, C>
) -> (A) -> EnvIO<D, E, C> {
    andThen(f, g)
}

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C, D: Monoid>(
    _ f: @escaping (A) -> Pair<D, B>,
    _ g: @escaping (B) -> Pair<D, C>
) -> (A) -> Pair<D, C> {
    { a in
        f(a).flatMap(g)
    }
}

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func >=><A, B, C, D: Monoid>(
    _ f: @escaping (A) -> Pair<D, B>,
    _ g: @escaping (B) -> Pair<D, C>
) -> (A) -> Pair<D, C> {
    andThen(f, g)
}
