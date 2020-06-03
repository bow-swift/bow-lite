public extension Optional {
    func fold<A>(
        _ ifNone: @escaping () -> A,
        _ ifSome: @escaping (Wrapped) -> A
    ) -> A {
        if let wrapped = self {
            return ifSome(wrapped)
        } else {
            return ifNone()
        }
    }
}
