public extension Result {
    static func raiseError(_ error: Failure) -> Result<Success, Failure> {
        .failure(error)
    }
    
    static func from(either: Either<Failure, Success>) -> Result<Success, Failure> {
        either.fold(Result.failure, Result.success)
    }
    
    func handleErrorWith(_ f: @escaping (Failure) -> Result<Success, Failure>) -> Result<Success, Failure> {
        self.fold(Result.success, f)
    }
    
    func handleError(_ f: @escaping (Failure) -> Success) -> Result<Success, Failure> {
        handleErrorWith(f >>> Result.success)
    }
}
