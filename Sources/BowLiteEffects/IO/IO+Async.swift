import Foundation
import BowLiteCore

public extension IO {
    /// Suspends side effects in the provided registration function. The parameter function is injected with a side-effectful callback for signaling the result of an asynchronous process.
    ///
    /// - Parameter proc: Asynchronous operation.
    /// - Returns: A computation describing the asynchronous operation.
    static func async(_ proc: @escaping IOProc<Failure, Success>) -> IO<Failure, Success> {
        asyncF { callback in
            IO<Failure, Void>.later {
                proc(callback)
            }
        }
    }
    
    /// Provides a computation that evaluates the provided function on every run.
    ///
    /// - Parameter queue: Dispatch queue which the computation must be sent to.
    /// - Parameter f: Function returning a value.
    /// - Returns: A computation that defers the execution of the provided function.
    static func `defer`(
        _ queue: DispatchQueue,
        _ f: @escaping () -> IO<Failure, Success>) -> IO<Failure, Success> {
        IO<Failure, Void>.lazy().continueOn(queue).flatMap(f)
    }
    
    /// Provides a computation that evaluates the provided function on every run.
    ///
    /// - Parameter queue: Dispatch queue which the computation must be sent to.
    /// - Parameter f: Function returning a value.
    /// - Returns: A computation that defers the execution of the provided function.
    static func later(
        _ queue: DispatchQueue,
        _ f: @escaping () throws -> Success) -> IO<Failure, Success> {
        Self.defer(queue) {
            do {
                return pure(try f())
            } catch {
                return raiseError(error as! Failure)
            }
        }
    }
    
    /// Provides a computation that evaluates the provided function on every run.
    ///
    /// - Parameter queue: Dispatch queue which the computation must be sent to.
    /// - Parameter f: A function that provides a value or an error.
    /// - Returns: A computation that defers the execution of the provided value.
    static func delayOrRaise(
        _ queue: DispatchQueue,
        _ f: @escaping () -> Either<Failure, Success>
    ) -> IO<Failure, Success> {
        Self.defer(queue) { f().fold(Self.raiseError, Self.pure) }
    }
    
    /// Provides an asynchronous computation that never finishes.
    ///
    /// - Returns: An asynchronous computation that never finishes.
    static func never() -> IO<Failure, Success> {
        async { _ in }
    }
}
