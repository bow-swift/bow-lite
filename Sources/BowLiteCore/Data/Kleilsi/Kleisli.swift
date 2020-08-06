import Foundation

precedencegroup KleisliCompositionPrecedence {
    associativity: left
}

infix operator >=>: KleisliCompositionPrecedence

// MARK: Kleisli for Array

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C>(
    _ f: @escaping (A) -> [B],
    _ g: @escaping (B) -> [C]
) -> (A) -> [C] {
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
public func >=><A, B, C>(
    _ f: @escaping (A) -> [B],
    _ g: @escaping (B) -> [C]
) -> (A) -> [C] {
    andThen(f, g)
}

// MARK: Kleisli for Eval

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C>(
    _ f: @escaping (A) -> Eval<B>,
    _ g: @escaping (B) -> Eval<C>
) -> (A) -> Eval<C> {
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
public func >=><A, B, C>(
    _ f: @escaping (A) -> Eval<B>,
    _ g: @escaping (B) -> Eval<C>
) -> (A) -> Eval<C> {
    andThen(f, g)
}

// MARK: Kleisli for Either

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C, D>(
    _ f: @escaping (A) -> Either<D, B>,
    _ g: @escaping (B) -> Either<D, C>
) -> (A) -> Either<D, C> {
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
    _ f: @escaping (A) -> Either<D, B>,
    _ g: @escaping (B) -> Either<D, C>
) -> (A) -> Either<D, C> {
    andThen(f, g)
}

// MARK: Kleisli for Function

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C, D>(
    _ f: @escaping (A) -> Function<D, B>,
    _ g: @escaping (B) -> Function<D, C>
) -> (A) -> Function<D, C> {
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
    _ f: @escaping (A) -> Function<D, B>,
    _ g: @escaping (B) -> Function<D, C>
) -> (A) -> Function<D, C> {
    andThen(f, g)
}

// MARK: Kleisli for Id

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C>(
    _ f: @escaping (A) -> Id<B>,
    _ g: @escaping (B) -> Id<C>
) -> (A) -> Id<C> {
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
public func >=><A, B, C>(
    _ f: @escaping (A) -> Id<B>,
    _ g: @escaping (B) -> Id<C>
) -> (A) -> Id<C> {
    andThen(f, g)
}

// MARK: Kleisli for Ior

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C, D: Monoid>(
    _ f: @escaping (A) -> Ior<D, B>,
    _ g: @escaping (B) -> Ior<D, C>
) -> (A) -> Ior<D, C> {
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
    _ f: @escaping (A) -> Ior<D, B>,
    _ g: @escaping (B) -> Ior<D, C>
) -> (A) -> Ior<D, C> {
    andThen(f, g)
}

// MARK: Kleisli for NEA

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C>(
    _ f: @escaping (A) -> NEA<B>,
    _ g: @escaping (B) -> NEA<C>
) -> (A) -> NEA<C> {
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
public func >=><A, B, C>(
    _ f: @escaping (A) -> NEA<B>,
    _ g: @escaping (B) -> NEA<C>
) -> (A) -> NEA<C> {
    andThen(f, g)
}

// MARK: Kleisli for Optional

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C>(
    _ f: @escaping (A) -> B?,
    _ g: @escaping (B) -> C?
) -> (A) -> C? {
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
public func >=><A, B, C>(
    _ f: @escaping (A) -> B?,
    _ g: @escaping (B) -> C?
) -> (A) -> C? {
    andThen(f, g)
}

// MARK: Kleisli for Result

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C, D: Error>(
    _ f: @escaping (A) -> Result<B, D>,
    _ g: @escaping (B) -> Result<C, D>
) -> (A) -> Result<C, D> {
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
public func >=><A, B, C, D: Error>(
    _ f: @escaping (A) -> Result<B, D>,
    _ g: @escaping (B) -> Result<C, D>
) -> (A) -> Result<C, D> {
    andThen(f, g)
}

// MARK: Kleisli for State

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C, D>(
    _ f: @escaping (A) -> State<D, B>,
    _ g: @escaping (B) -> State<D, C>
) -> (A) -> State<D, C> {
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
    _ f: @escaping (A) -> State<D, B>,
    _ g: @escaping (B) -> State<D, C>
) -> (A) -> State<D, C> {
    andThen(f, g)
}

// MARK: Kleisli for Try

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C>(
    _ f: @escaping (A) -> Try<B>,
    _ g: @escaping (B) -> Try<C>
) -> (A) -> Try<C> {
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
public func >=><A, B, C>(
    _ f: @escaping (A) -> Try<B>,
    _ g: @escaping (B) -> Try<C>
) -> (A) -> Try<C> {
    andThen(f, g)
}

// MARK: Kleisli for Writer

/// Composes two effectful functions.
///
/// - Parameters:
///   - f: Left-hand side of the composition.
///   - g: Right-hand side of the composition.
/// - Returns: A function resulting from the Kleisli composition of the two effectful functions provided.
public func andThen<A, B, C, D: Monoid>(
    _ f: @escaping (A) -> Writer<D, B>,
    _ g: @escaping (B) -> Writer<D, C>
) -> (A) -> Writer<D, C> {
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
    _ f: @escaping (A) -> Writer<D, B>,
    _ g: @escaping (B) -> Writer<D, C>
) -> (A) -> Writer<D, C> {
    andThen(f, g)
}
