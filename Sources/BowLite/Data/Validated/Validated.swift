/// An alias over Validated where the invalid cases are accumulated using a non-empty array.
public typealias ValidatedNEA<Invalid, Valid> = Validated<NEA<Invalid>, Valid>

/// Validated is a data type to represent valid and invalid values. It is similar to `Either`, but with error accumulation in the invalid case.
public enum Validated<Invalid, Valid> {
    case invalid(Invalid)
    case valid(Valid)
    
    /// Applies the provided closures based on the content of this `Validated` value.
    ///
    /// - Parameters:
    ///   - ifInvalid: Closure to apply if the contained value is invalid.
    ///   - ifValid: Closure to apply if the contained value is valid.
    /// - Returns: Result of applying the corresponding closure to the contained value.
    public func fold<A>(
        _ ifInvalid: @escaping (Invalid) -> A,
        _ ifValid: @escaping (Valid) -> A
    ) -> A {
        switch self {
        case .invalid(let invalid): return ifInvalid(invalid)
        case .valid(let valid): return ifValid(valid)
        }
    }
    
    /// Checks if this value is invalid.
    public var isInvalid: Bool {
        fold(constant(true), constant(false))
    }
    
    /// Checks if this value is valid.
    public var isValid: Bool {
        !isInvalid
    }
    
    /// Obtains the invalid value, if present.
    public var invalidValue: Invalid? {
        fold(id, constant(nil))
    }
    
    /// Obtains the valid value, if present.
    public var validValue: Valid? {
        fold(constant(nil), id)
    }
    
    /// Transforms both type parameters, preserving the structure of this value.
    ///
    /// - Parameters:
    ///   - f: Closure to be applied when there is a left value.
    ///   - g: Closure to be applied when there is a right value.
    /// - Returns: Result of applying the corresponding closure to this value.
    public func bimap<A, B>(
        _ f: @escaping (Invalid) -> A,
        _ g: @escaping (Valid) -> B
    ) -> Validated<A, B> {
        fold(Validated<A, B>.invalid <<< f,
             Validated<A, B>.valid <<< g)
    }
    
    /// Converts this value into a ValidatedNEA.
    ///
    /// - Returns: A ValidatedNEA where invalid values are wrapped in a non-empty array.
    public func toValidatedNEA() -> ValidatedNEA<Invalid, Valid> {
        bimap(NEA.pure, id)
    }
}

// MARK: Conformance to Equatable for Validated
extension Validated: Equatable where Invalid: Equatable, Valid: Equatable {}

// MARK: Conformance to CustomStringConvertible for Validated
extension Validated: CustomStringConvertible where Invalid: CustomStringConvertible, Valid: CustomStringConvertible {
    public var description: String {
        fold(
            { invalid in "Invalid(\(invalid.description))" },
            { valid in "Valid(\(valid.description))" }
        )
    }
}
