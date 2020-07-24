public struct Prism<Source, Target> {
    public let embed: (Target) -> Source
    public let extract: (Source) -> Target?
    
    public init(
        embed: @escaping (Target) -> Source,
        extract: @escaping (Source) -> Target?) {
        self.embed = embed
        self.extract = extract
    }
    
    public func modify(
        _ source: Source,
        _ transform: @escaping (Target) -> Target
    ) -> Source {
        self.extract(source).fold(
            constant(source),
            { target in self.embed(transform(target)) })
    }
    
    public func lift(
        _ transform: @escaping (Target) -> Target
    ) -> (Source) -> Source {
        { source in self.modify(source, transform) }
    }
    
    public func set(_ source: Source, _ newTarget: Target) -> Source {
        modify(source, constant(newTarget))
    }
    
    public func modifyOptional(
        _ source: Source,
        _ transform: @escaping (Target) -> Target
    ) -> Source? {
        self.extract(source).map { target in self.embed(transform(target)) }
    }
    
    public func liftOptional(
        _ transform: @escaping (Target) -> Target
    ) -> (Source) -> Source? {
        { source in self.modifyOptional(source, transform) }
    }
    
    public func setOptional(
        _ source: Source,
        _ newTarget: Target
    ) -> Source? {
        modifyOptional(source, constant(newTarget))
    }
    
    public func left<Extra>() -> Prism<Either<Source, Extra>, Either<Target, Extra>> {
        Prism<Either<Source, Extra>, Either<Target, Extra>>(
            embed: { either in
                either.bimap(self.embed, id)
            },
            extract: { either in
                either.fold(
                    { left in self.extract(left).map(Either.left) },
                    Either.right
                )
            }
        )
    }
    
    public func right<Extra>() -> Prism<Either<Extra, Source>, Either<Extra, Target>> {
        Prism<Either<Extra, Source>, Either<Extra, Target>>(
            embed: { either in
                either.bimap(id, self.embed)
            },
            extract: { either in
                either.fold(
                    Either.left,
                    { right in self.extract(right).map(Either.right) })
            }
        )
    }
    
    public func compose<NewTarget>(
        _ prism: Prism<Target, NewTarget>
    ) -> Prism<Source, NewTarget> {
        Prism<Source, NewTarget>(
            embed: prism.embed >>> self.embed,
            extract: { source in
                self.extract(source).flatMap(prism.extract)
            }
        )
    }
    
    public func compose<NewTarget>(
        _ lens: Lens<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        AffineTraversal<Source, NewTarget>(
            get: { source in
                self.extract(source).map(lens.get)
            },
            set: { source, newTarget in
                self.modify(source) { target in
                    lens.set(target, newTarget)
                }
            }
        )
    }
    
    public func compose<NewTarget>(
        _ affine: AffineTraversal<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        AffineTraversal<Source, NewTarget>(
            get: self.extract >=> affine.get,
            set: { source, newTarget in
                self.modify(source) { target in
                    affine.set(target, newTarget)
                }
            }
        )
    }
    
    public func compose<NewTarget>(
        _ traversal: Traversal<Target, NewTarget>
    ) -> Traversal<Source, NewTarget> {
        Traversal<Source, NewTarget>(
            modify: { source, transform in
                self.modify(source) { target in
                    traversal.modify(target, transform)
                }
            }
        )
    }
    
    public static func +<NewTarget>(
        lhs: Prism<Source, Target>,
        rhs: Prism<Target, NewTarget>
    ) -> Prism<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    public static func +<NewTarget>(
        lhs: Prism<Source, Target>,
        rhs: AffineTraversal<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    public static func +<NewTarget>(
        lhs: Prism<Source, Target>,
        rhs: Lens<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    public static func +<NewTarget>(
        lhs: Prism<Source, Target>,
        rhs: Traversal<Target, NewTarget>
    ) -> Traversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    public var asAffineTraversal: AffineTraversal<Source, Target> {
        AffineTraversal(get: self.extract, set: self.set)
    }
    
    public var asTraversal: Traversal<Source, Target> {
        Traversal(modify: self.modify)
    }
    
    public static func `for`(
        _ embed: @escaping (Target) -> Source
    ) -> Prism<Source, Target> {
        
        func isSameCase(_ lhs: Source, _ rhs: Source) -> Bool {
            guard let lhsChild = Mirror(reflecting: lhs).children.first,
                  let rhsChild = Mirror(reflecting: rhs).children.first else { return false }
            
            let lhsLabeledChild = Mirror(reflecting: lhsChild.value).children.first
            let rhsLabeledChild = Mirror(reflecting: rhsChild.value).children.first
            
            return lhsChild.label == rhsChild.label &&
                   lhsLabeledChild?.label == rhsLabeledChild?.label
        }
        
        func extract(_ source: Source) -> Target? {
            let mirror = Mirror(reflecting: source)
            guard let child = mirror.children.first else { return nil }
            
            if let value = child.value as? Target {
                return value
            } else {
                let labeledValueMirror = Mirror(reflecting: child.value)
                return labeledValueMirror.children.first?.value as? Target
            }
        }
        
        func autoDerivation(_ source: Source) -> Target? {
            guard let values = extract(source) else { return nil }
            guard isSameCase(embed(values), source) else { return nil }
            return values
        }
        
        return Prism(embed: embed, extract: autoDerivation)
    }
}

// Using operator / to obtain prisms, as seen on
// Pointfree's Case Paths: https://github.com/pointfreeco/swift-case-paths
prefix operator /

public prefix func /<Source, Target>(
    _ embed: @escaping (Target) -> Source
) -> Prism<Source, Target> {
    Prism.for(embed)
}
