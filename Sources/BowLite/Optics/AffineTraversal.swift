public struct AffineTraversal<Source, Target> {
    public let get: (Source) -> Target?
    public let set: (Source, Target) -> Source
    
    public init(
        get: @escaping (Source) -> Target?,
        set: @escaping (Source, Target) -> Source) {
        self.get = get
        self.set = set
    }
    
    public func modify(
        _ source: Source,
        _ transform: @escaping (Target) -> Target
    ) -> Source {
        modifyOptional(source, transform) ?? source
    }
    
    public func lift(
        _ transform: @escaping (Target) -> Target
    ) -> (Source) -> Source {
        { source in self.modify(source, transform) }
    }
    
    public func modifyOptional(
        _ source: Source,
        _ transform: @escaping (Target) -> Target
    ) -> Source? {
        self.get(source).map(transform).map { newTarget in
            self.set(source, newTarget)
        }
    }
    
    public func choice<Other>(
        _ affine: AffineTraversal<Other, Target>
    ) -> AffineTraversal<Either<Source, Other>, Target> {
        AffineTraversal<Either<Source, Other>, Target>(
            get: { either in either.fold(self.get, affine.get) },
            set: { either, newTarget in
                either.bimap(
                    { this in self.set(this, newTarget) },
                    { other in affine.set(other, newTarget) })
            }
        )
    }
    
    public func first<Extra>() -> AffineTraversal<(Source, Extra), (Target, Extra)> {
        AffineTraversal<(Source, Extra), (Target, Extra)>(
            get: { source, extra in
                self.get(source).map { target in (target, extra) }
            },
            set: { sourcePair, targetPair in
                (self.set(sourcePair.0, targetPair.0), targetPair.1)
            }
        )
    }
    
    public func second<Extra>() -> AffineTraversal<(Extra, Source), (Extra, Target)> {
        AffineTraversal<(Extra, Source), (Extra, Target)>(
            get: { extra, source in
                self.get(source).map { target in (extra, target) }
            }, set: { sourcePair, targetPair in
                (targetPair.0, self.set(sourcePair.1, targetPair.1))
            }
        )
    }
    
    public func compose<NewTarget>(
        _ affine: AffineTraversal<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        AffineTraversal<Source, NewTarget>(
            get: { source in
                self.get(source).flatMap(affine.get)
            }, set: { source, newTarget in
                self.get(source).flatMap { target in
                    affine.set(target, newTarget)
                }.map { target in
                    self.set(source, target)
                } ?? source
            }
        )
    }
    
    public func compose<NewTarget>(
        _ lens: Lens<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        AffineTraversal<Source, NewTarget>(
            get: { source in
                self.get(source).flatMap(lens.get)
            },
            set: { source, newTarget in
                self.get(source).flatMap { target in
                    self.set(source, lens.set(target, newTarget))
                } ?? source
            }
        )
    }
}

public extension AffineTraversal where Source == Target {
    static var identity: AffineTraversal<Source, Source> {
        AffineTraversal(
            get: id, set: { _, source in source }
        )
    }
}

public extension WritableKeyPath {
    func affine<Target>() -> AffineTraversal<Root, Target> where Value == Target? {
        AffineTraversal(
            get: { source in source[keyPath: self] },
            set: { source, newTarget in
                var copy = source
                copy[keyPath: self] = newTarget
                return copy
            }
        )
    }
}
