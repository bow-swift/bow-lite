public extension IO {
    static func later(_ f: @escaping () throws -> Success) -> IO<Failure, Success> {
        Self.defer {
            do {
                return pure(try f())
            } catch {
                return raiseError(error as! Failure)
            }
        }
    }
    
    static func later(_ value: IO<Failure, Success>) -> IO<Failure, Success> {
        Self.defer { value }
    }
    
    static func laterOrRaise(_ f: @escaping () -> Either<Failure, Success>) -> IO<Failure, Success> {
        self.defer {
            f().fold(Self.raiseError, Self.pure)
        }
    }
}

public extension IO where Success == Void {
    static func lazy() -> IO<Failure, Void> {
        later {}
    }
}
