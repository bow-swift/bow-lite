import Foundation
import BowLiteCore

public extension IO {
    /// Provides a computation that evaluates the provided function on every run.
    ///
    /// - Parameter f: Function returning a value.
    /// - Returns: A computation that defers the execution of the provided function.
    static func later(_ f: @escaping () throws -> Success) -> IO<Failure, Success> {
        Self.defer {
            do {
                return pure(try f())
            } catch {
                return raiseError(error as! Failure)
            }
        }
    }
    
    /// Provides a computation that evaluates the provided computation on every run.
    ///
    /// - Parameter value: A value describing a computation to be deferred.
    /// - Returns: A computation that defers the execution of the provided value.
    static func later(_ value: IO<Failure, Success>) -> IO<Failure, Success> {
        Self.defer { value }
    }
    
    /// Provides a computation that evaluates the provided function on every run.
    ///
    /// - Parameter f: A function that provides a value or an error.
    /// - Returns: A computation that defers the execution of the provided value.
    static func laterOrRaise(_ f: @escaping () -> Either<Failure, Success>) -> IO<Failure, Success> {
        self.defer {
            f().fold(Self.raiseError, Self.pure)
        }
    }
}

public extension IO where Success == Void {
    /// Provides a lazy computation that returns void.
    ///
    /// - Returns: A deferred computation of the void value.
    static func lazy() -> IO<Failure, Void> {
        later {}
    }
}
