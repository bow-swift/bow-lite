/// Describes the outcome of an operation on a resource.
///
/// - completed: The operation was completed successfully.
/// - canceled: The operation was canceled.
/// - error: The operation finished with an error.
public enum ExitCase<E> {
    case completed
    case canceled
    case error(E)
    
    /// Applies a function based on the content of this value.
    ///
    /// - Parameters:
    ///   - ifCompleted: Function to be applied if this value is completed.
    ///   - ifCanceled: Function to be applied if this value is canceled.
    ///   - ifError: Function to be applied if this value is errored.
    /// - Returns: Result of applying the corresponding function based on the content of this value.
    public func fold<A>(
        _ ifCompleted: () -> A,
        _ ifCanceled: () -> A,
        _ ifError: (E) -> A) -> A {
        switch self {
        case .completed: return ifCompleted()
        case .canceled: return ifCanceled()
        case let .error(e): return ifError(e)
        }
    }
}

extension ExitCase: CustomStringConvertible {
    public var description: String {
        return fold(constant("ExitCase.Completed"),
                    constant("ExitCase.Canceled"),
                    { e in "ExitCase.Error(\(e))" })
    }
}

extension ExitCase: Equatable where E: Equatable {}

public func ==<E: Equatable>(lhs: ExitCase<E>, rhs: ExitCase<E>) -> Bool {
    switch (lhs, rhs) {
    case (.completed, .completed): return true
    case (.canceled, .canceled): return true
    case let (.error(e1), .error(e2)): return e1 == e2
    default: return false
    }
}

public extension IO {
    func bracket<Output>(
        release: @escaping (Success) -> IO<Failure, Void>,
        use: @escaping (Success) -> IO<Failure, Output>
    ) -> IO<Failure, Output> {
        bracketCase(
            release: { resource, _ in release(resource) },
            use: use)
    }
    
    func uncancelable() -> IO<Failure, Success> {
        bracket(release: constant(IO<Failure, Void>.pure(())), use: Self.pure)
    }
    
    func guarantee(finalizer: IO<Failure, Void>) -> IO<Failure, Success> {
        guaranteeCase(finalizer: constant(finalizer))
    }
    
    func guaranteeCase(finalizer: @escaping (ExitCase<Failure>) -> IO<Failure, Void>) -> IO<Failure, Success> {
        IO<Failure, Void>.pure(())
            .bracketCase(release: { _, exit in finalizer(exit) },
                         use: { self })
    }
}
