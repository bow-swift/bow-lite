public extension Optional {
    /// Lifts an error to this context.
    ///
    /// - Returns: A value representing the error in this context.
    static func raiseError() -> Wrapped? {
        nil
    }
    
    /// Converts an Either value into this type.
    ///
    /// - Parameter either: Either value to be converted.
    /// - Returns: A value of this type containing the information from the Either value.
    static func from<L>(either: Either<L, Wrapped>) -> Wrapped? {
        either.fold(constant(nil), id)
    }
    
    /// Converts an Result value into this type.
    ///
    /// - Parameter result: Result value to be converted.
    /// - Returns: A value of this type containing the information from the Result value.
    static func from<E: Error>(result: Result<Wrapped, E>) -> Wrapped? {
        result.fold(id, constant(nil))
    }
    
    /// Handles an error, potentially recovering from it by mapping it to a value in this context.
    ///
    /// - Parameters:
    ///   - f: A recovery function.
    /// - Returns: A value where the possible errors have been recovered using the provided function.
    func handleErrorWith(_ f: @escaping () -> Wrapped?) -> Wrapped? {
        self ?? f()
    }
    
    /// Handles an error, potentially recovering from it by mapping it to a value.
    ///
    /// - Parameters:
    ///   - f: A recovery function.
    /// - Returns: A value where the possible errors have been recovered using the provided function.
    func handleError(_ f: @escaping () -> Wrapped) -> Wrapped? {
        handleErrorWith(f)
    }
}
