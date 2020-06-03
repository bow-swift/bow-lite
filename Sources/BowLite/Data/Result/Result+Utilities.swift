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

extension Result: Semigroup where Failure: Semigroup, Success: Semigroup {
    public func combine(_ other: Result<Success, Failure>) -> Result<Success, Failure> {
        switch (self, other) {
        case (.failure(let f1), .failure(let f2)):
            return .failure(f1.combine(f2))
        case (.success(let s1), .success(let s2)):
            return .success(s1.combine(s2))
        case (.failure(let f), _), (_, .failure(let f)):
            return .failure(f)
        }
    }
}

extension Result: Monoid where Failure: Monoid, Success: Monoid {
    public static var empty: Result<Success, Failure> {
        .success(.empty)
    }
}
