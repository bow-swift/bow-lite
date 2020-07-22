import Foundation

public extension IO {
    static func async(_ proc: @escaping IOProc<Failure, Success>) -> IO<Failure, Success> {
        asyncF { callback in
            IO<Failure, Void>.later {
                proc(callback)
            }
        }
    }
    
    static func `defer`(
        _ queue: DispatchQueue,
        _ f: @escaping () -> IO<Failure, Success>) -> IO<Failure, Success> {
        IO<Failure, Void>.lazy().continueOn(queue).flatMap(f)
    }
    
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
    
    
    static func delayOrRaise(
        _ queue: DispatchQueue,
        _ f: @escaping () -> Either<Failure, Success>
    ) -> IO<Failure, Success> {
        Self.defer(queue) { f().fold(Self.raiseError, Self.pure) }
    }
    
    static func never() -> IO<Failure, Success> {
        async { _ in }
    }
}
