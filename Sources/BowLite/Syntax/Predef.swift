public func id<A>(_ a: A) -> A {
    a
}

public func constant<A>(_ a: @autoclosure @escaping () -> A) -> () -> A {
    a
}

public func constant<A, B>(_ a: @autoclosure @escaping () -> A) -> (B) -> A {
    { _ in a() }
}

public func constant<A, B, C>(_ a: @autoclosure @escaping () -> A) -> (B, C) -> A {
    { _, _ in a() }
}

public func constant<A, B, C, D>(_ a: @autoclosure @escaping () -> A) -> (B, C, D) -> A {
    { _, _, _ in a() }
}

public func constant<A, B, C, D, E>(_ a: @autoclosure @escaping () -> A) -> (B, C, D, E) -> A {
    { _, _, _, _ in a() }
}
