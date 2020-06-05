public struct Lens<Source, Target> {
    public let get: (Source) -> Target
    public let set: (Source, Target) -> Source
    
    public init(
        get: @escaping (Source) -> Target,
        set: @escaping (Source, Target) -> Source
    ) {
        self.get = get
        self.set = set
    }
    
    public func modify(
        _ source: Source,
        _ transform: @escaping (Target) -> Target
    ) -> Source {
        set(source, transform(get(source)))
    }
    
    public func lift(
        _ transform: @escaping (Target) -> Target
    ) -> (Source) -> Source {
        { source in self.modify(source, transform) }
    }
    
    public func choice<Other>(
        _ lens: Lens<Other, Target>
    ) -> Lens<Either<Source, Other>, Target> {
        Lens<Either<Source, Other>, Target>(
            get: { either in
                either.fold(self.get, lens.get)
            }, set: { either, newTarget in
                either.bimap(
                    { this in self.set(this, newTarget) },
                    { other in lens.set(other, newTarget) }
                )
            }
        )
    }
    
    public func split<OtherSource, OtherTarget>(
        _ lens: Lens<OtherSource, OtherTarget>
    ) -> Lens<(Source, OtherSource), (Target, OtherTarget)> {
        Lens<(Source, OtherSource), (Target, OtherTarget)>(
            get: { pair in (self.get(pair.0), lens.get(pair.1)) },
            set: { sourcePair, targetPair in
                (self.set(sourcePair.0, targetPair.0),
                 lens.set(sourcePair.1, targetPair.1))
            }
        )
    }
    
    public func first<Extra>() -> Lens<(Source, Extra), (Target, Extra)> {
        Lens<(Source, Extra), (Target, Extra)>(
            get: { source, extra in (self.get(source), extra) },
            set: { sourcePair, targetPair in
                (self.set(sourcePair.0, targetPair.0), sourcePair.1)
            }
        )
    }
    
    public func second<Extra>() -> Lens<(Extra, Source), (Extra, Target)> {
        Lens<(Extra, Source), (Extra, Target)>(
            get: { (extra, source) in (extra, self.get(source)) },
            set: { sourcePair, targetPair in
                (sourcePair.0, self.set(sourcePair.1, targetPair.1))
            }
        )
    }
    
    public func compose<NewTarget>(
        _ lens: Lens<Target, NewTarget>
    ) -> Lens<Source, NewTarget> {
        Lens<Source, NewTarget>(
            get: self.get >>> lens.get,
            set: { source, newTarget in
                self.set(source, lens.set(self.get(source), newTarget))
            }
        )
    }
}

public extension Lens where Source == Target {
    static var identity: Lens<Source, Source> {
        Lens(get: id, set: { _, newSource in newSource })
    }
}
