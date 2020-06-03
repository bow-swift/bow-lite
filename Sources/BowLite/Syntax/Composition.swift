public func compose<A, B, C>(
    _ g: @escaping (B) -> C,
    _ f: @escaping (A) -> B
) -> (A) -> C {
    { a in g(f(a)) }
}

public func compose<A, B>(
    _ g: @escaping (A) -> B,
    _ f: @escaping () -> A
) -> () -> B {
    { g(f()) }
}

public func andThen<A, B, C>(
    _ f: @escaping (A) -> B,
    _ g: @escaping (B) -> C
) -> (A) -> C {
    { a in g(f(a)) }
}

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

public func <<<<A, B, C>(
    _ g: @escaping (B) -> C,
    _ f: @escaping (A) -> B
) -> (A) -> C {
    { a in g(f(a)) }
}

public func <<<<A, B>(
    _ g: @escaping (A) -> B,
    _ f: @escaping () -> A
) -> () -> B {
    { g(f()) }
}

public func >>><A, B, C>(
    _ f: @escaping (A) -> B,
    _ g: @escaping (B) -> C
) -> (A) -> C {
    { a in g(f(a)) }
}

public func >>><A, B>(
    _ f: @escaping () -> A,
    _ g: @escaping (A) -> B
) -> () -> B {
    { g(f()) }
}
