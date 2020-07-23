public enum Either<Left, Right> {
    case left(Left)
    case right(Right)
    
    var isLeft: Bool {
        fold(constant(true), constant(false))
    }
    
    var isRight: Bool {
        !isLeft
    }
    
    var leftValue: Left? {
        fold(id, constant(nil))
    }
    
    var rightValue: Right? {
        fold(constant(nil), id)
    }
    
    public func fold<A>(
        _ ifLeft: @escaping (Left) -> A,
        _ ifRight: @escaping (Right) -> A
    ) -> A {
        switch self {
        case .left(let left): return ifLeft(left)
        case .right(let right): return ifRight(right)
        }
    }
    
    public func swap() -> Either<Right, Left> {
        fold(Either<Right, Left>.right,
             Either<Right, Left>.left)
    }
    
    public func bimap<L, R>(
        _ f: @escaping (Left) -> L,
        _ g: @escaping (Right) -> R
    ) -> Either<L, R> {
        fold(Either<L, R>.left <<< f,
             Either<L, R>.right <<< g)
    }
    
    public func mapLeft<L>(
        _ f: @escaping (Left) -> L
    ) -> Either<L, Right> {
        bimap(f, id)
    }
    
    public func map<R>(
        _ f: @escaping (Right) -> R
    ) -> Either<Left, R> {
        bimap(id, f)
    }
    
    public func flatMap<R>(
        _ f: @escaping (Right) -> Either<Left, R>
    ) -> Either<Left, R> {
        fold(Either<Left, R>.left, f)
    }
    
    public func toOptional() -> Right? {
        rightValue
    }
    
    public func getOrHandle(_ f: @escaping (Left) -> Right) -> Right {
        fold(f, id)
    }
    
    public func getOrElse(_ defaultValue: Right) -> Right {
        self.fold(constant(defaultValue), id)
    }
    
    public func filterOrElse(
        defaultValue: Left,
        _ predicate: @escaping (Right) -> Bool
    ) -> Either<Left, Right> {
        self.flatMap { right in
            predicate(right) ? Either.left(defaultValue) : Either.right(right)
        }
    }
}

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

extension Either: Monoid where Left: Monoid, Right: Monoid {
    public static var empty: Either<Left, Right> {
        .right(Right.empty)
    }
}

extension Either: Equatable where Left: Equatable, Right: Equatable {}

extension Either: CustomStringConvertible where Left: CustomStringConvertible, Right: CustomStringConvertible {
    public var description: String {
        fold(
            { left in "Left(\(left.description))" },
            { right in "Right(\(right.description))" }
        )
    }
}

public extension Either where Left == Right {
    func merge() -> Right {
        self.fold(id, id)
    }
}
