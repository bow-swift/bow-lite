public extension EnvIO {
    static func later(_ f: @escaping () throws -> Success) -> EnvIO<Dependencies, Failure, Success> {
        Self.defer {
            do {
                return pure(try f())
            } catch {
                return raiseError(error as! Failure)
            }
        }
    }
    
    static func later(_ value: EnvIO<Dependencies, Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        Self.defer { value }
    }
    
    static func laterOrRaise(_ f: @escaping () -> Either<Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        self.defer {
            f().fold(Self.raiseError, Self.pure)
        }
    }
}

public extension EnvIO where Success == Void {
    static func lazy() -> EnvIO<Dependencies, Failure, Void> {
        later {}
    }
}
