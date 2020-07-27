public extension Optional {
    /// Applies a function based on the presence or absence of a value.
    ///
    /// - Parameters:
    ///   - ifNone: A closure that is executed when there is no value in the `Optional`.
    ///   - ifSome: A closure that is executed where there is a value in the `Optional`. In such case, the the inner value is sent as an argument of this function.
    /// - Returns: Result of applying the corresponding closure based on the value of this object.
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
