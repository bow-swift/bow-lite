public enum Validated<Invalid, Valid> {
    case invalid(Invalid)
    case valid(Valid)
    
    public func fold<A>(
        _ ifInvalid: @escaping (Invalid) -> A,
        _ ifValid: @escaping (Valid) -> A
    ) -> A {
        switch self {
        case .invalid(let invalid): return ifInvalid(invalid)
        case .valid(let valid): return ifValid(valid)
        }
    }
    
    public var isInvalid: Bool {
        fold(constant(true), constant(false))
    }
    
    public var isValid: Bool {
        !isInvalid
    }
    
    public var invalidValue: Invalid? {
        fold(id, constant(nil))
    }
    
    public var validValue: Valid? {
        fold(constant(nil), id)
    }
    
    public func bimap<A, B>(
        _ f: @escaping (Invalid) -> A,
        _ g: @escaping (Valid) -> B
    ) -> Validated<A, B> {
        fold(Validated<A, B>.invalid <<< f,
             Validated<A, B>.valid <<< g)
    }
}
