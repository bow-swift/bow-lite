/// A Prism is a loss less invertible optic that can look into a structure and optionally find its focus. It is mostly used for finding a focus that is only present under certain conditions, like in a sum type.
///
/// A Prism gathers the two concepts of pattern matching and constructor and thus can be seen as a pair of functions:
///     - `extract` meaning it returns the focus of a Prism if present.
///     - `embed` meaning we can construct the source type of a Prism from a focus.
public struct Prism<Source, Target> {
    /// Creates a value of the source type from a value of the focus.
    public let embed: (Target) -> Source
    
    /// Obtains the focused value from a source, if possible.
    public let extract: (Source) -> Target?
    
    /// Creates a prism based on functions to extract and embed a value into a sum type.
    ///
    /// - Parameters:
    ///   - extract: Function to extract a value from the source.
    ///   - embed: Function to embed a value into the source.
    public init(
        embed: @escaping (Target) -> Source,
        extract: @escaping (Source) -> Target?) {
        self.embed = embed
        self.extract = extract
    }
    
    /// Modifies the source with the provided function.
    ///
    /// - Parameters:
    ///   - source: Source.
    ///   - tranform: Modifying function.
    /// - Returns: Modified source.
    public func modify(
        _ source: Source,
        _ transform: @escaping (Target) -> Target
    ) -> Source {
        self.extract(source).fold(
            constant(source),
            { target in self.embed(transform(target)) })
    }
    
    /// Lifts a function modifying the focus to one modifying the source.
    ///
    /// - Parameter transform: Modifying function.
    /// - Returns: Function that modifies the source.
    public func lift(
        _ transform: @escaping (Target) -> Target
    ) -> (Source) -> Source {
        { source in self.modify(source, transform) }
    }
    
    /// Sets a new value in the focus of the source, if possible.
    ///
    /// - Parameters:
    ///   - source: Source.
    ///   - newTarget: Modified focus.
    /// - Returns: Modified source.
    public func set(_ source: Source, _ newTarget: Target) -> Source {
        modify(source, constant(newTarget))
    }
    
    /// Optionally modifies the source with a function.
    ///
    /// - Parameters:
    ///   - source: Source.
    ///   - transform: Modifying function.
    /// - Returns: Optional modified source.
    public func modifyOptional(
        _ source: Source,
        _ transform: @escaping (Target) -> Target
    ) -> Source? {
        self.extract(source).map { target in self.embed(transform(target)) }
    }
    
    /// Lifts a function modifying the focus to a function that optionally modifies the source.
    ///
    /// - Parameter transform: Modifying function.
    /// - Returns: Function that optionally modifies the source.
    public func liftOptional(
        _ transform: @escaping (Target) -> Target
    ) -> (Source) -> Source? {
        { source in self.modifyOptional(source, transform) }
    }
    
    /// Sets a modified focus.
    ///
    /// - Parameters:
    ///   - source: Source.
    ///   - transform: Modified focus.
    /// - Returns: Optional modified source.
    public func setOptional(
        _ source: Source,
        _ newTarget: Target
    ) -> Source? {
        modifyOptional(source, constant(newTarget))
    }
    
    /// Creates the sum of this Prism with another type, placing this as the left side.
    ///
    /// - Returns: A Prism that operates on `Either`s where the right side remains unchanged.
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
    
    /// Creates the sum of this Prism with another type, placing this as the right side.
    ///
    /// - Returns: A Prism that operates on `Either`s where the left side remains unchanged.
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
    
    /// Composes this value with a Prism.
    ///
    /// - Parameter prism: Value to compose with.
    /// - Returns: A Prism resulting from the sequential application of the two provided optics.
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
    
    /// Composes this value with a Lens.
    ///
    /// - Parameter lens: Value to compose with.
    /// - Returns: An AffineTraversal resulting from the sequential application of the two provided optics.
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
    
    /// Composes this value with an AffineTraversal.
    ///
    /// - Parameter affine: Value to compose with.
    /// - Returns: An AffineTraversal resulting from the sequential application of the two provided optics.
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
    
    /// Composes this value with a Traversal.
    ///
    /// - Parameter traversal: Value to compose with.
    /// - Returns: A Traversal resulting from the sequential application of the two provided optics.
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
    
    /// Composes a Prism with a Prism.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: A Prism resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: Prism<Source, Target>,
        rhs: Prism<Target, NewTarget>
    ) -> Prism<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Composes a Prism with an AffineTraversal.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: An AffineTraversal resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: Prism<Source, Target>,
        rhs: AffineTraversal<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Composes a Prism with a Lens.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: An AffineTraversal resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: Prism<Source, Target>,
        rhs: Lens<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Composes a Prism with a Traversal.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: A Traversal resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: Prism<Source, Target>,
        rhs: Traversal<Target, NewTarget>
    ) -> Traversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Converts this optic into an AffineTraversal.
    public var asAffineTraversal: AffineTraversal<Source, Target> {
        AffineTraversal(get: self.extract, set: self.set)
    }
    
    /// Converts this optic into a Traversal.
    public var asTraversal: Traversal<Source, Target> {
        Traversal(modify: self.modify)
    }
    
    /// Creates a Prism for a sum type from its embed function, using reflection.
    ///
    /// - Parameter embed: Embed function.
    /// - Returns: A Prism focused on a specific type out of a sum type.
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

/// Creates a Prism for a sum type from its embed function, using reflection.
///
/// - Parameter embed: Embed function.
/// - Returns: A Prism focused on a specific type out of a sum type.
public prefix func /<Source, Target>(
    _ embed: @escaping (Target) -> Source
) -> Prism<Source, Target> {
    Prism.for(embed)
}
