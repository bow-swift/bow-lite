/// Composes a 1-ary function with a 1-ary function.
///
/// Returns a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side of the function composition.
///   - f: Right-hand side of the function composition.
/// - Returns: A function that applies `g` to the output of `f`.
public func compose<A, B, C>(
    _ g: @escaping (B) -> C,
    _ f: @escaping (A) -> B
) -> (A) -> C {
    { a in g(f(a)) }
}

/// Composes a 0-ary function with a 1-ary function.
///
/// Returns a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side of the function composition.
///   - f: Right-hand side of the function composition.
/// - Returns: A function that applies `g` to the output of `f`.
public func compose<A, B>(
    _ g: @escaping (A) -> B,
    _ f: @escaping () -> A
) -> () -> B {
    { g(f()) }
}

/// Composes a 1-ary function with a 1-ary function.
///
/// Returns a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side of the function composition.
///   - f: Right-hand side of the function composition.
/// - Returns: A function that applies `g` to the output of `f`.
public func andThen<A, B, C>(
    _ f: @escaping (A) -> B,
    _ g: @escaping (B) -> C
) -> (A) -> C {
    { a in g(f(a)) }
}

/// Composes a 0-ary function with a 1-ary function.
///
/// Returns a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side of the function composition.
///   - g: Right-hand side of the function composition.
/// - Returns: A function that applies `g` to the output of `f`.
public func andThen<A, B>(
    _ f: @escaping () -> A,
    _ g: @escaping (A) -> B
) -> () -> B {
    { g(f()) }
}

precedencegroup CompositionPrecedence {
    associativity: left
}

infix operator <<<: CompositionPrecedence
infix operator >>>: CompositionPrecedence

/// Composes a 1-ary function with a 1-ary function.
///
/// Returns a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side of the function composition.
///   - f: Right-hand side of the function composition.
/// - Returns: A function that applies `g` to the output of `f`.
public func <<<<A, B, C>(
    _ g: @escaping (B) -> C,
    _ f: @escaping (A) -> B
) -> (A) -> C {
    { a in g(f(a)) }
}

/// Composes a 0-ary function with a 1-ary function.
///
/// Returns a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side of the function composition.
///   - f: Right-hand side of the function composition.
/// - Returns: A function that applies `g` to the output of `f`.
public func <<<<A, B>(
    _ g: @escaping (A) -> B,
    _ f: @escaping () -> A
) -> () -> B {
    { g(f()) }
}

/// Composes a 1-ary function with a 1-ary function.
///
/// Returns a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side of the function composition.
///   - g: Right-hand side of the function composition.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>><A, B, C>(
    _ f: @escaping (A) -> B,
    _ g: @escaping (B) -> C
) -> (A) -> C {
    { a in g(f(a)) }
}

/// Composes a 0-ary function with a 1-ary function.
///
/// Returns a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side of the function composition.
///   - g: Right-hand side of the function composition.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>><A, B>(
    _ f: @escaping () -> A,
    _ g: @escaping (A) -> B
) -> () -> B {
    { g(f()) }
}
