public extension Validated {
    static func raiseError(_ invalid: Invalid) -> Validated<Invalid, Valid> {
        .invalid(invalid)
    }
    
    static func from(either: Either<Invalid, Valid>) -> Validated<Invalid, Valid> {
        either.fold(Validated.invalid, Validated.valid)
    }
    
    func handleErrorWith(_ f: @escaping (Invalid) -> Validated<Invalid, Valid>) -> Validated<Invalid, Valid> {
        self.fold(f, Validated.valid)
    }
    
    func handleError(_ f: @escaping (Invalid) -> Valid) -> Validated<Invalid, Valid> {
        handleErrorWith(f >>> Validated.valid)
    }
}

public extension Validated where Invalid: Error {
    static func from(result: Result<Valid, Invalid>) -> Validated<Invalid, Valid> {
        result.fold(Validated.valid, Validated.invalid)
    }
}
