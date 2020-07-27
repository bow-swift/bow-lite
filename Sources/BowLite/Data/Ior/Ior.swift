/// Ior represents an inclusive-or of two different types. It may have a value of the left type, the right type or both at the same time.
public enum Ior<Left, Right> {
    case left(Left)
    case right(Right)
    case both(Left, Right)
    
    /// Applies the provided closures based on the content of this `Ior` value.
    ///
    /// - Parameters:
    ///   - fa: Closure to apply if the contained value in this `Ior` is a member of the left type.
    ///   - fb: Closure to apply if the contained value in this `Ior` is a member of the right type.
    ///   - fab: Closure to apply if the contained values in this `Ior` are members of both types.
    /// - Returns: Result of aplying the corresponding closure to this value.
    public func fold<A>(
        _ ifLeft: @escaping (Left) -> A,
        _ ifRight: @escaping (Right) -> A,
        _ ifBoth: @escaping (Left, Right) -> A
    ) -> A {
        switch self {
        case .left(let left): return ifLeft(left)
        case .right(let right): return ifRight(right)
        case .both(let left, let right): return ifBoth(left, right)
        }
    }
    
    /// Checks if this value contains only a value of the left type.
    public var isLeft: Bool {
        fold(constant(true),
             constant(false),
             constant(false))
    }
    
    /// Checks if this value contains only a value of the right type.
    public var isRight: Bool {
        fold(constant(false),
             constant(true),
             constant(false))
    }
    
    /// Checks if this value contains values of both left and right types.
    public var isBoth: Bool {
        fold(constant(false),
             constant(false),
             constant(true))
    }
    
    /// Obtains the left value, if present.
    public var leftValue: Left? {
        fold(id, constant(nil), constant(nil))
    }
    
    /// Obtains the right value, if present.
    public var rightValue: Right? {
        fold(constant(nil), id, constant(nil))
    }
    
    /// Obtains both values, if present.
    public var bothValue: (Left, Right)? {
        fold(constant(nil), constant(nil), { l, r in (l, r) })
    }
    
    /// Swaps the type parameters.
    ///
    /// - Returns: An `Ior` where the left values are right and vice versa, and both values are swapped.
    public func swap() -> Ior<Right, Left> {
        fold(Ior<Right, Left>.right,
             Ior<Right, Left>.left,
             { l, r in Ior<Right, Left>.both(r, l) })
    }
    
    /// Transforms both type parameters with the provided closures.
    ///
    /// - Parameters:
    ///   - f: Closure to transform the left type.
    ///   - g: Closure to transform the right type.
    /// - Returns: An `Ior` value with its type parameters transformed using the provided functions.
    public func bimap<A, B>(
        _ f: @escaping (Left) -> A,
        _ g: @escaping (Right) -> B
    ) -> Ior<A, B> {
        fold(Ior<A, B>.left <<< f,
             Ior<A, B>.right <<< g,
             { l, r in Ior<A, B>.both(f(l), g(r)) })
    }
    
    /// Transforms the left type parameter with the provided closure.
    ///
    /// - Parameter f: Transforming function.
    /// - Returns: An `Ior` value with its left type parameter transformed using the provided function.
    public func mapLeft<A>(_ f: @escaping (Left) -> A) -> Ior<A, Right> {
        bimap(f, id)
    }
}

// MARK: Conformance of Equatable for Ior
extension Ior: Equatable where Left: Equatable, Right: Equatable {}

// MARK: Conformance of CustomStringConvertible for Ior
extension Ior: CustomStringConvertible where Left: CustomStringConvertible, Right: CustomStringConvertible {
    public var description: String {
        fold(
            { left in "Left(\(left.description))" },
            { right in "Right(\(right.description))" },
            { left, right in "Both(\(left.description), \(right.description))" }
        )
    }
}
