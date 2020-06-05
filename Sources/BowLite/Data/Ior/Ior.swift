public enum Ior<Left, Right> {
    case left(Left)
    case right(Right)
    case both(Left, Right)
    
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
    
    public var isLeft: Bool {
        fold(constant(true),
             constant(false),
             constant(false))
    }
    
    public var isRight: Bool {
        fold(constant(false),
             constant(true),
             constant(false))
    }
    
    public var isBoth: Bool {
        fold(constant(false),
             constant(false),
             constant(true))
    }
    
    public var leftValue: Left? {
        fold(id, constant(nil), constant(nil))
    }
    
    public var rightValue: Right? {
        fold(constant(nil), id, constant(nil))
    }
    
    public var bothValue: (Left, Right)? {
        fold(constant(nil), constant(nil), { l, r in (l, r) })
    }
    
    public func swap() -> Ior<Right, Left> {
        fold(Ior<Right, Left>.right,
             Ior<Right, Left>.left,
             { l, r in Ior<Right, Left>.both(r, l) })
    }
    
    public func bimap<A, B>(
        _ f: @escaping (Left) -> A,
        _ g: @escaping (Right) -> B
    ) -> Ior<A, B> {
        fold(Ior<A, B>.left <<< f,
             Ior<A, B>.right <<< g,
             { l, r in Ior<A, B>.both(f(l), g(r)) })
    }
}

extension Ior: Equatable where Left: Equatable, Right: Equatable {}
