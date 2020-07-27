/// Sum type of types `Left` and `Right`. Represents a value of either one of those types, but not both at the same time. Values of type `Left` are called left; values of type `Right` are called right.
public enum Either<Left, Right> {
    case left(Left)
    case right(Right)
    
    /// Checks if this value belongs to the left type.
    var isLeft: Bool {
        fold(constant(true), constant(false))
    }
    
    /// Checks if this value belongs to the right type.
    var isRight: Bool {
        !isLeft
    }
    
    /// Obtains the left value, if present.
    var leftValue: Left? {
        fold(id, constant(nil))
    }
    
    /// Obtains the right value, if present.
    var rightValue: Right? {
        fold(constant(nil), id)
    }
    
    /// Applies the provided closures based on the content of this `Either` value.
    ///
    /// - Parameters:
    ///   - ifLeft: Closure to apply if the contained value in this `Either` is a member of the left type.
    ///   - ifRight: Closure to apply if the contained value in this `Either` is a member of the right type.
    /// - Returns: Result of applying the corresponding closure to this value.
    public func fold<A>(
        _ ifLeft: @escaping (Left) -> A,
        _ ifRight: @escaping (Right) -> A
    ) -> A {
        switch self {
        case .left(let left): return ifLeft(left)
        case .right(let right): return ifRight(right)
        }
    }
    
    /// Reverses the types of this either. Left values become right values and vice versa.
    ///
    /// - Returns: An either value with its types reversed respect to this one.
    public func swap() -> Either<Right, Left> {
        fold(Either<Right, Left>.right,
             Either<Right, Left>.left)
    }
    
    /// Transforms both type parameters, preserving the structure of this value.
    ///
    /// - Parameters:
    ///   - fa: Closure to be applied when there is a left value.
    ///   - fb: Closure to be applied when there is a right value.
    /// - Returns: Result of applying the corresponding closure to this value.
    public func bimap<L, R>(
        _ f: @escaping (Left) -> L,
        _ g: @escaping (Right) -> R
    ) -> Either<L, R> {
        fold(Either<L, R>.left <<< f,
             Either<L, R>.right <<< g)
    }
    
    /// Transforms the left type parameter, preserving the structure of this value.
    ///
    /// - Parameter f: Transforming closure.
    /// - Returns: Result of appliying the transformation to any left value in this value.
    public func mapLeft<L>(
        _ f: @escaping (Left) -> L
    ) -> Either<L, Right> {
        bimap(f, id)
    }
    
    /// Creates a new value transforming this type using the provided function, preserving the structure of the original type.
    ///
    /// The implementation of this function must obey two laws:
    ///
    /// 1. Preserve identity:
    ///
    ///         map(fa, id) == fa
    ///
    /// 2. Preserve composition:
    ///
    ///         map(map(fa, f), g) == map(fa, compose(g, f))
    ///
    /// - Parameters:
    ///   - f: A transforming function.
    /// - Returns: The result of transforming the value type using the provided function, maintaining the structure of the original value.
    public func map<R>(
        _ f: @escaping (Right) -> R
    ) -> Either<Left, R> {
        bimap(id, f)
    }
    
    /// Sequentially compose two computations, passing any value produced by the first as an argument to the second.
    ///
    /// - Parameters:
    ///   - f: A function describing the second computation, which depends on the value of the first.
    /// - Returns: Result of composing the two computations.
    public func flatMap<R>(
        _ f: @escaping (Right) -> Either<Left, R>
    ) -> Either<Left, R> {
        fold(Either<Left, R>.left, f)
    }
    
    /// Returns the value of the right type, or `nil` if it is a left value.
    public func toOptional() -> Right? {
        rightValue
    }
    
    /// Returns the value from this `Either.right` value or allows callers to transform the `Either.left` to `Either.right`.
    ///
    /// - Parameter f: Left transforming function.
    /// - Returns: Value of this `Either.right` or transformation of this `Either.left`.
    public func getOrHandle(_ f: @escaping (Left) -> Right) -> Right {
        fold(f, id)
    }
    
    /// Obtains the value wrapped if it is a right value, or the default value provided as an argument.
    ///
    /// - Parameter defaultValue: Value to be returned if this value is left.
    /// - Returns: The wrapped value if it is right; otherwise, the default value.
    public func getOrElse(_ defaultValue: Right) -> Right {
        self.fold(constant(defaultValue), id)
    }
    
    /// Filters the right values, providing a default left value if the do not match the provided predicate.
    ///
    /// - Parameters:
    ///   - predicate: Predicate to test the right value.
    ///   - defaultValue: Value to be returned if the right value does not satisfies the predicate.
    /// - Returns: This value, if it matches the predicate or is left; otherwise, a left value wrapping the default value.
    public func filterOrElse(
        defaultValue: Left,
        _ predicate: @escaping (Right) -> Bool
    ) -> Either<Left, Right> {
        self.flatMap { right in
            predicate(right) ? Either.left(defaultValue) : Either.right(right)
        }
    }
}

// MARK: Instance of Semigroup for Either
extension Either: Semigroup where Left: Semigroup, Right: Semigroup {
    public func combine(_ other: Either<Left, Right>) -> Either<Left, Right> {
        switch (self, other) {
        case (.left(let l1), .left(let l2)):
            return .left(l1.combine(l2))
        case (.right(let r1), .right(let r2)):
            return .right(r1.combine(r2))
        case (.left(let l), _), (_, .left(let l)):
            return .left(l)
        }
    }
}

// MARK: Instance of Monoid for Either
extension Either: Monoid where Left: Monoid, Right: Monoid {
    public static var empty: Either<Left, Right> {
        .right(Right.empty)
    }
}

// MARK: Conformance to Equatable for Either
extension Either: Equatable where Left: Equatable, Right: Equatable {}

// MARK: Conformance to CustomStringConvertible for Either
extension Either: CustomStringConvertible where Left: CustomStringConvertible, Right: CustomStringConvertible {
    public var description: String {
        fold(
            { left in "Left(\(left.description))" },
            { right in "Right(\(right.description))" }
        )
    }
}

public extension Either where Left == Right {
    /// Returns a value from either side.
    /// 
    /// - Returns: Value wrapped in this Either, regardless of the side it was.
    func merge() -> Right {
        self.fold(id, id)
    }
}
