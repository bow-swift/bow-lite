public extension Validated {
    /// Lifts an error to this context.
    ///
    /// - Parameter invalid: A value of the error type.
    /// - Returns: A value representing the error in this context.
    static func raiseError(_ invalid: Invalid) -> Validated<Invalid, Valid> {
        .invalid(invalid)
    }
    
    /// Creates a value of this type from an Either.
    ///
    /// - Parameter either: Result value to convert to this type.
    /// - Returns: A value that represents the same content from Either, in this context.
    static func from(either: Either<Invalid, Valid>) -> Validated<Invalid, Valid> {
        either.fold(Validated.invalid, Validated.valid)
    }
    
    /// Handles an error, potentially recovering from it by mapping it to a value in this context.
    ///
    /// - Parameters:
    ///   - f: A recovery function.
    /// - Returns: A value where the possible errors have been recovered using the provided function.
    func handleErrorWith(_ f: @escaping (Invalid) -> Validated<Invalid, Valid>) -> Validated<Invalid, Valid> {
        self.fold(f, Validated.valid)
    }
    
    /// Handles an error, potentially recovering from it by mapping it to a value.
    ///
    /// - Parameters:
    ///   - f: A recovery function.
    /// - Returns: A value where the possible errors have been recovered using the provided function.
    func handleError(_ f: @escaping (Invalid) -> Valid) -> Validated<Invalid, Valid> {
        handleErrorWith(f >>> Validated.valid)
    }
}

public extension Validated where Invalid: Error {
    /// Creates a value of this type from a Result.
    ///
    /// - Parameter result: Result value to convert to this type.
    /// - Returns: A value that represents the same content from Result, in this context.
    static func from(result: Result<Valid, Invalid>) -> Validated<Invalid, Valid> {
        result.fold(Validated.valid, Validated.invalid)
    }
}
