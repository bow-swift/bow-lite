/// Describes the result of an operation that may have thrown errors or succeeded. The type parameter corresponds to the result type of the operation.
public enum Try<Success> {
    case failure(Error)
    case success(Success)
    
    /// Invokes a closure that may throw errors and wraps the result in a `Try` value.
    ///
    /// - Parameter f: Closure to be invoked.
    /// - Returns: A `Try` value wrapping the result of the invocation or any error that it may have thrown.
    public static func catching(_ f: @escaping () throws -> Success) -> Try<Success> {
        do {
            let success = try f()
            return .success(success)
        } catch {
            return .failure(error)
        }
    }
    
    /// Applies the provided closures based on the content of this `Try` value.
    ///
    /// - Parameters:
    ///   - ifFailure: Closure to apply if the contained value in this `Try` is an error.
    ///   - ifSuccess: Closure to apply if the contained value in this `Try` is a successful value.
    /// - Returns: Result of applying the corresponding closure to this value.
    public func fold<A>(
        _ ifFailure: @escaping (Error) -> A,
        _ ifSuccess: @escaping (Success) -> A
    ) -> A {
        switch self {
        case .failure(let error): return ifFailure(error)
        case .success(let success): return ifSuccess(success)
        }
    }
    
    /// Checks if this value is a failure.
    public var isFailure: Bool {
        fold(constant(true), constant(false))
    }
    
    /// Checks if this value is a success.
    public var isSuccess: Bool {
        !isFailure
    }
    
    /// Obtains the failure value, if present.
    public var failureValue: Error? {
        fold(id, constant(nil))
    }
    
    /// Obtains the success value, if present.
    public var successValue: Success? {
        fold(constant(nil), id)
    }
}

// MARK: Conformance of CustomStringConvertible for Try
extension Try: CustomStringConvertible where Success: CustomStringConvertible {
    public var description: String {
        fold(
            { error in "Failure(\(error))" },
            { success in "Success(\(success.description))" })
    }
}
