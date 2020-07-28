/// A Lens (or Functional Reference) is an optic that can focus into a structure for getting, setting or modifying the focus (target).
///
/// A Lens can be seen as a pair of functions:
///     - `get`, meaning we can focus into `Source` and extract a `Target`.
///     - `set`, meaning we can focus into an `Source` and set a value `Target`, obtaining a modified source.
public struct Lens<Source, Target> {
    /// Gets the focused value from the provided source.
    public let get: (Source) -> Target
    
    /// Creates a new modified source replacing the focused value with the provided one.
    public let set: (Source, Target) -> Source
    
    /// Initializes a Lens.
    ///
    /// - Parameters:
    ///   - get: Getter function.
    ///   - set: Setter function.
    public init(
        get: @escaping (Source) -> Target,
        set: @escaping (Source, Target) -> Source
    ) {
        self.get = get
        self.set = set
    }
    
    /// Modifies the focus of this lens with the provided function.
    ///
    /// - Parameters:
    ///   - source: Source.
    ///   - transform: Modifying function.
    /// - Returns: Modified source.
    public func modify(
        _ source: Source,
        _ transform: @escaping (Target) -> Target
    ) -> Source {
        set(source, transform(get(source)))
    }
    
    /// Lifts a function that modifies the targets, to a function that modifies the sources.
    ///
    /// - Parameter transform: Modifying function.
    /// - Returns: Function that modifies sources.
    public func lift(
        _ transform: @escaping (Target) -> Target
    ) -> (Source) -> Source {
        { source in self.modify(source, transform) }
    }
    
    /// Joins two lenses with the same focus.
    ///
    /// - Parameter lens: A lens with the same focus as this one.
    /// - Returns: A lens whose source is a either of the two original lenses.
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
    
    /// Pairs two disjoint lenses.
    ///
    /// - Parameter lens: A disjoint lens.
    /// - Returns: A lens that operates on tuples of the original and parameter sources and targets.
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
    
    /// Pairs this Lens with another type, placing this as the first element.
    ///
    /// - Returns: A Lens that operates on tuples where the second argument remains unchanged.
    public func first<Extra>() -> Lens<(Source, Extra), (Target, Extra)> {
        Lens<(Source, Extra), (Target, Extra)>(
            get: { source, extra in (self.get(source), extra) },
            set: { sourcePair, targetPair in
                (self.set(sourcePair.0, targetPair.0), sourcePair.1)
            }
        )
    }
    
    /// Pairs this Lens with another type, placing this as the second element.
    ///
    /// - Returns: A Lens that operates on tuples where the first argument remains unchanged.
    public func second<Extra>() -> Lens<(Extra, Source), (Extra, Target)> {
        Lens<(Extra, Source), (Extra, Target)>(
            get: { (extra, source) in (extra, self.get(source)) },
            set: { sourcePair, targetPair in
                (sourcePair.0, self.set(sourcePair.1, targetPair.1))
            }
        )
    }
    
    /// Composes this Lens with a Lens.
    ///
    /// - Parameter other: Value to compose with.
    /// - Returns: A Lens resulting from the sequential application of the two optics.
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
    
    /// Composes this Lens with an AffineTraversal.
    ///
    /// - Parameter other: Value to compose with.
    /// - Returns: An AffineTraversal resulting from the sequential application of the two optics.
    public func compose<NewTarget>(
        _ affine: AffineTraversal<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        AffineTraversal<Source, NewTarget>(
            get: self.get >>> affine.get,
            set: { source, newTarget in
                self.set(source, affine.set(self.get(source), newTarget))
            }
        )
    }
    
    /// Composes this Lens with a Traversal.
    ///
    /// - Parameter other: Value to compose with.
    /// - Returns: A Traversal resulting from the sequential application of the two optics.
    public func compose<NewTarget>(
        _ traversal: Traversal<Target, NewTarget>
    ) -> Traversal<Source, NewTarget> {
        Traversal<Source, NewTarget>(
            modify: { source, transform in
                self.set(source, traversal.modify(self.get(source), transform))
            }
        )
    }
    
    /// Composes this Lens with a Prism.
    ///
    /// - Parameter other: Value to compose with.
    /// - Returns: An AffineTraversal resulting from the sequential application of the two optics.
    public func compose<NewTarget>(
        _ prism: Prism<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        AffineTraversal<Source, NewTarget>(
            get: self.get >>> prism.extract,
            set: { source, newTarget in
                self.modify(source) { target in
                    prism.set(target, newTarget)
                }
            }
        )
    }
    
    /// Composes a Lens with a Lens.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: A Lens resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: Lens<Source, Target>,
        rhs: Lens<Target, NewTarget>
    ) -> Lens<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Composes a Lens with an AffineTraversal.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: An AffineTraversal resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: Lens<Source, Target>,
        rhs: AffineTraversal<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Composes a Lens with a Prism.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: An AffineTraversal resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: Lens<Source, Target>,
        rhs: Prism<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Composes a Lens with a Traversal.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: A Traversal resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: Lens<Source, Target>,
        rhs: Traversal<Target, NewTarget>
    ) -> Traversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Converts this optic into an AffineTraversal.
    public var asAffineTraversal: AffineTraversal<Source, Target> {
        AffineTraversal(get: self.get, set: self.set)
    }
    
    /// Converts this optic into a Traversal.
    public var asTraversal: Traversal<Source, Target> {
        Traversal(modify: self.modify)
    }
}

public extension Lens where Source == Target {
    /// Identity Lens.
    static var identity: Lens<Source, Source> {
        Lens(get: id, set: { _, newSource in newSource })
    }
}

public extension WritableKeyPath {
    /// Creates a Lens that operates on values of type `Root` and focus on the property given by this key path.
    var lens: Lens<Root, Value> {
        Lens(
            get: { root in root[keyPath: self] },
            set: { root, newValue in
                var copy = root
                copy[keyPath: self] = newValue
                return copy
            })
    }
}
