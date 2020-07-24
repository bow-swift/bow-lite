/// Identity function.
///
/// Returns the input without changing it.
///
/// - Parameter a: A value.
/// - Returns: The value received as input, with no modifications.
public func id<A>(_ a: A) -> A {
    a
}

/// Provides a constant function.
///
/// - Parameter a: Constant value to return.
/// - Returns: A 0-ary function that constantly return the value provided as argument.
public func constant<A>(_ a: @autoclosure @escaping () -> A) -> () -> A {
    a
}

/// Provides a constant function.
///
/// - Parameter a: Constant value to return.
/// - Returns: A 1-ary function that constantly return the value provided as argument, regardless of its input parameter.
public func constant<A, B>(_ a: @autoclosure @escaping () -> A) -> (B) -> A {
    { _ in a() }
}

/// Provides a constant function.
///
/// - Parameter a: Constant value to return.
/// - Returns: A 2-ary function that constantly return the value provided as argument, regardless of its input parameter.
public func constant<A, B, C>(_ a: @autoclosure @escaping () -> A) -> (B, C) -> A {
    { _, _ in a() }
}

/// Provides a constant function.
///
/// - Parameter a: Constant value to return.
/// - Returns: A 3-ary function that constantly return the value provided as argument, regardless of its input parameter.
public func constant<A, B, C, D>(_ a: @autoclosure @escaping () -> A) -> (B, C, D) -> A {
    { _, _, _ in a() }
}

/// Provides a constant function.
///
/// - Parameter a: Constant value to return.
/// - Returns: A 4-ary function that constantly return the value provided as argument, regardless of its input parameter.
public func constant<A, B, C, D, E>(_ a: @autoclosure @escaping () -> A) -> (B, C, D, E) -> A {
    { _, _, _, _ in a() }
}
