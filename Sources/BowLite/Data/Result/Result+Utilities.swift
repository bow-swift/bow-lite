public extension Result {
    func fold<A>(
        _ ifSuccess: @escaping (Success) -> A,
        _ ifFailure: @escaping (Failure) -> A
    ) -> A {
        switch self {
        case .failure(let error): return ifFailure(error)
        case .success(let success): return ifSuccess(success)
        }
    }
}
