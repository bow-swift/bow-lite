import Foundation
import BowLiteCore

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
    /// A way to safely acquire a resource and release in the face of errors and cancellations.
    ///
    /// - Parameters:
    ///   - release: Function to release the acquired resource, ignoring the outcome of the release of the resource.
    ///   - use: Function to use the acquired resource.
    /// - Returns: Computation describing the result of using the resource.
    func bracket<Output>(
        release: @escaping (Success) -> IO<Failure, Void>,
        use: @escaping (Success) -> IO<Failure, Output>
    ) -> IO<Failure, Output> {
        bracketCase(
            release: { resource, _ in release(resource) },
            use: use)
    }
    
    /// Forces a resource to be uncancelable even when an interruption happens.
    ///
    /// - Returns: An uncancelable computation.
    func uncancelable() -> IO<Failure, Success> {
        bracket(release: constant(IO<Failure, Void>.pure(())), use: Self.pure)
    }
    
    /// Executes the given finalizer when the source is finished, either in success, error or cancelation.
    ///
    /// - Parameters:
    ///   - finalizer: Finalizer function to be invoked when the resource is released.
    /// - Returns: A computation describing the resouce that will invoke the finalizer when it is released.
    func guarantee(finalizer: IO<Failure, Void>) -> IO<Failure, Success> {
        guaranteeCase(finalizer: constant(finalizer))
    }
    
    /// Executes the given finalizer when the source is finished, either in success, error or cancelation, alowing to differentiate between exit conditions.
    ///
    /// - Parameters:
    ///   - finalizer: Finalizer function to be invoked when the resource is released, distinguishing the exit case.
    /// - Returns: A computation describing the resource that will invoke the finalizer when it is released.
    func guaranteeCase(finalizer: @escaping (ExitCase<Failure>) -> IO<Failure, Void>) -> IO<Failure, Success> {
        IO<Failure, Void>.pure(())
            .bracketCase(release: { _, exit in finalizer(exit) },
                         use: { self })
    }
}
