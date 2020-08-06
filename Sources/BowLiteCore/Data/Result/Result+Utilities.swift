public extension Result {
    /// Applies the provided closures based on the content of this `Result` value.
    ///
    /// - Parameters:
    ///   - ifSuccess: Closure to apply if the contained value in this `Result` is a member of the Success type.
    ///   - ifFailure: Closure to apply if the contained value in this `Result` is a member of the Failure type.
    /// - Returns: Result of applying the corresponding closure to this value.
    func fold<A>(
        _ ifSuccess: @escaping (Success) -> A,
        _ ifFailure: @escaping (Failure) -> A
    ) -> A {
        switch self {
        case .failure(let error): return ifFailure(error)
        case .success(let success): return ifSuccess(success)
        }
    }
    
    /// Converts this value to an Either.
    ///
    /// - Returns: An Either value that maps failures to the left case, and successes to the right case.
    func toEither() -> Either<Failure, Success> {
        fold(Either.right, Either.left)
    }
    
    /// Converts this value to a Validated.
    ///
    /// - Returns: A Validated value that maps failures to the invalid case, and successes to the valid case.
    func toValidated() -> Validated<Failure, Success> {
        fold(Validated.valid, Validated.invalid)
    }
    
    /// Converts this value to a ValidatedNEA.
    ///
    /// - Returns: A ValidatedNEA value that maps failures to the invalid case, and successes to the valid case.
    func toValidatedNEA() -> ValidatedNEA<Failure, Success> {
        toValidated().toValidatedNEA()
    }
    
    /// Converts this value to a Try.
    ///
    /// - Returns: A Try value that maps failures to the failure case, and successes to the success case.
    func toTry() -> Try<Success> {
        fold(Try.success, Try.failure)
    }
}

// MARK: Instance of Semigroup for Result
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

// MARK: Instance of Monoid for Result
extension Result: Monoid where Failure: Monoid, Success: Monoid {
    public static var empty: Result<Success, Failure> {
        .success(.empty)
    }
}
