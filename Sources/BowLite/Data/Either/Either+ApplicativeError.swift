public extension Either {
    static func raiseError(_ error: Left) -> Either<Left, Right> {
        .left(error)
    }
    
    func handleErrorWith(_ f: @escaping (Left) -> Either<Left, Right>) -> Either<Left, Right> {
        self.fold(f, Either.right)
    }
    
    func handleError(_ f: @escaping (Left) -> Right) -> Either<Left, Right> {
        handleErrorWith(f >>> Either.right)
    }
}

public extension Either where Left: Error {
    static func from(result: Result<Right, Left>) -> Either<Left, Right> {
        result.fold(Either.right, Either.left)
    }
}
