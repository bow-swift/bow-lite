import Foundation

public extension EnvIO {
    static func async(_ proc: @escaping IOProc<Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        asyncF { callback in
            EnvIO<Dependencies, Failure, Void>.later {
                proc(callback)
            }
        }
    }
    
    static func `defer`(
        _ queue: DispatchQueue,
        _ f: @escaping () -> EnvIO<Dependencies, Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO<Dependencies, Failure, Void>.lazy().continueOn(queue).flatMap(f)
    }
    
    static func later(
        _ queue: DispatchQueue,
        _ f: @escaping () throws -> Success) -> EnvIO<Dependencies, Failure, Success> {
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
    ) -> EnvIO<Dependencies, Failure, Success> {
        Self.defer(queue) { f().fold(Self.raiseError, Self.pure) }
    }
    
    static func never() -> EnvIO<Dependencies, Failure, Success> {
        async { _ in }
    }
}
