import Foundation
import BowLiteCore

/// An AffineTraversal is an optic that allows to see into a structure and getting, setting or modifying an optional focus.
///
/// An AffineTraversal can be seen as a weaker `Lens` and `Prism` and combines their weakest functions:
///     - `set` meaning we can focus into a `Source` and set a value `Target`.
///     - `get` meaning it returns the focus of an `AffineTraversal` (if present) or the original value.
public struct AffineTraversal<Source, Target> {
    /// Obtains the optional target, given a source
    public let get: (Source) -> Target?
    
    /// Creates a new source from the provided one, setting the target focused by this optic.
    public let set: (Source, Target) -> Source
    
    /// Initializes an AffineTraversal
    ///
    /// - Parameters:
    ///   - get: Getter function.
    ///   - set: Setter function.
    public init(
        get: @escaping (Source) -> Target?,
        set: @escaping (Source, Target) -> Source) {
        self.get = get
        self.set = set
    }
    
    /// Modifies the focus with a function.
    ///
    /// - Parameters:
    ///   - source: Source.
    ///   - transform: Modifying function.
    /// - Returns: Modified source.
    public func modify(
        _ source: Source,
        _ transform: @escaping (Target) -> Target
    ) -> Source {
        modifyOptional(source, transform) ?? source
    }
    
    /// Lifts a function modifying the focus to a function modifying the source.
    ///
    /// - Parameter transform: Modifying function.
    /// - Returns: A function modifying the source.
    public func lift(
        _ transform: @escaping (Target) -> Target
    ) -> (Source) -> Source {
        { source in self.modify(source, transform) }
    }
    
    /// Modifies the source with a function if it matches.
    ///
    /// - Parameters:
    ///   - source: Source.
    ///   - transform: Modifying function.
    /// - Returns: An optional modified source that is present if the modification took place.
    public func modifyOptional(
        _ source: Source,
        _ transform: @escaping (Target) -> Target
    ) -> Source? {
        self.get(source).map(transform).map { newTarget in
            self.set(source, newTarget)
        }
    }
    
    /// Joins with an AffineTraversal with the same focus.
    ///
    /// - Parameter affine: Value to join with.
    /// - Returns: An AffineTraversal that operates in either of the original sources.
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
    
    /// Pairs this AffineTraversal with another type, placing this as the first element.
    ///
    /// - Returns: An AffineTraversal that operates on tuples where the second argument remains unchanged.
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
    
    /// Pairs this AffineTraversal with another type, placing this as the second element.
    ///
    /// - Returns: An AffineTraversal that operates on tuples where the first argument remains unchanged.
    public func second<Extra>() -> AffineTraversal<(Extra, Source), (Extra, Target)> {
        AffineTraversal<(Extra, Source), (Extra, Target)>(
            get: { extra, source in
                self.get(source).map { target in (extra, target) }
            }, set: { sourcePair, targetPair in
                (targetPair.0, self.set(sourcePair.1, targetPair.1))
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
    
    /// Composes this value with a Lens.
    ///
    /// - Parameter lens: Value to compose with.
    /// - Returns: An AffineTraversal resulting from the sequential application of the two provided optics.
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
    
    /// Composes this value with a Traversal.
    ///
    /// - Parameter traversal: Value to compose with.
    /// - Returns: A Traversal resulting from the sequential application of the two provided optics.
    public func compose<NewTarget>(
        _ traversal: Traversal<Target, NewTarget>
    ) -> Traversal<Source, NewTarget> {
        Traversal<Source, NewTarget>(
            modify: { source, transform in
                self.get(source).map { target in
                    traversal.modify(target, transform)
                }.map { newTarget in
                    self.set(source, newTarget)
                } ?? source
            }
        )
    }
    
    /// Composes this value with a Prism.
    ///
    /// - Parameter prism: Value to compose with.
    /// - Returns: An AffineTraversal resulting from the sequential application of the two provided optics.
    public func compose<NewTarget>(
        _ prism: Prism<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        AffineTraversal<Source, NewTarget>(
            get: self.get >=> prism.extract,
            set: { source, newTarget in
                self.modify(source) { target in
                    prism.set(target, newTarget)
                }
            }
        )
    }
    
    /// Composes an AffineTraversal with an AffineTraversal.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: An AffineTraversal resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: AffineTraversal<Source, Target>,
        rhs: AffineTraversal<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Composes an AffineTraversal with a Lens.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: An AffineTraversal resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: AffineTraversal<Source, Target>,
        rhs: Lens<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Composes an AffineTraversal with a Prism.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: An AffineTraversal resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: AffineTraversal<Source, Target>,
        rhs: Prism<Target, NewTarget>
    ) -> AffineTraversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Composes an AffineTraversal with a Traversal.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: A Traversal resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: AffineTraversal<Source, Target>,
        rhs: Traversal<Target, NewTarget>
    ) -> Traversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Converts this optic into a Traversal.
    public var asTraversal: Traversal<Source, Target> {
        Traversal<Source, Target>(modify: self.modify)
    }
}

public extension AffineTraversal where Source == Target {
    /// Identity AffineTraversal
    static var identity: AffineTraversal<Source, Source> {
        AffineTraversal(
            get: id, set: { _, source in source }
        )
    }
}

public extension WritableKeyPath {
    /// Obtains an AffineTraversal.
    ///
    /// - Returns: An AffineTraversal working on elements of type `Root` and focused on the `Target?` value provided by this key path.
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
    
    /// Obtains an AffineTraversal focused on an index of an array.
    ///
    /// - Parameter index: Index for the focus of the optic.
    /// - Returns: An AffineTraversal focused on an element of the array targeted by this key path.
    func index<Target>(_ index: Int) -> AffineTraversal<Root, Target> where Value == [Target] {
        AffineTraversal(
            get: { source in source[keyPath: self][safe: index] },
            set: { source, newTarget in
                var copy = source
                copy[keyPath: self][safe: index] = newTarget
                return copy
            }
        )
    }
}
