import Foundation
import BowLiteCore

/// A Traversal is an optic that allows to see into a structure with 0 to N foci.
///
/// Traversal is a generalization of `Traverse` and can be seen as a representation of `modify`.
public struct Traversal<Source, Target> {
    /// Modifies the provided source using a transforming function, creating a new source.
    public let modify: (Source, @escaping (Target) -> Target) -> Source
    
    /// Initializes a Traversal.
    ///
    /// - Parameter modify: Modify function.
    public init(modify: @escaping (Source, @escaping (Target) -> Target) -> Source) {
        self.modify = modify
    }
    
    /// Sets a new value into the foci of a given source.
    ///
    /// - Parameters:
    ///   - source: Source value.
    ///   - newElement: Value to be set in the foci of the source.
    /// - Returns: A new source with the provided value in its foci.
    public func set(
        _ source: Source,
        _ newElement: Target
    ) -> Source {
        modify(source, constant(newElement))
    }
    
    /// Composes this value with a Traversal.
    ///
    /// - Parameter traversal: Value to compose with.
    /// - Returns: A Traversal resulting from the sequential application of the two optics.
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
    
    /// Composes this value with a Lens.
    ///
    /// - Parameter lens: Value to compose with.
    /// - Returns: A Traversal resulting from the sequential application of the two optics.
    public func compose<NewTarget>(
        _ lens: Lens<Target, NewTarget>
    ) -> Traversal<Source, NewTarget> {
        Traversal<Source, NewTarget>(
            modify: { source, transform in
                self.modify(source) { target in
                    lens.set(target, transform(lens.get(target)))
                }
            }
        )
    }
    
    /// Composes this value with an AffineTraversal.
    ///
    /// - Parameter affine: Value to compose with.
    /// - Returns: A Traversal resulting from the sequential application of the two optics.
    public func compose<NewTarget>(
        _ affine: AffineTraversal<Target, NewTarget>
    ) -> Traversal<Source, NewTarget> {
        Traversal<Source, NewTarget>(
            modify: { source, transform in
                self.modify(source) { target in
                    affine.get(target).map(transform).map { newTarget in
                        affine.set(target, newTarget)
                    } ?? target
                }
            }
        )
    }
    
    /// Composes this value with a Prism.
    ///
    /// - Parameter prism: Value to compose with.
    /// - Returns: A Traversal resulting from the sequential application of the two optics.
    public func compose<NewTarget>(
        _ prism: Prism<Target, NewTarget>
    ) -> Traversal<Source, NewTarget> {
        Traversal<Source, NewTarget>(
            modify: { source, transform in
                self.modify(source) { target in
                    prism.modify(target, transform)
                }
            }
        )
    }
    
    /// Composes a Traversal with a Traversal.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: A Traversal resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: Traversal<Source, Target>,
        rhs: Traversal<Target, NewTarget>
    ) -> Traversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Composes a Traversal with a Lens.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: A Traversal resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: Traversal<Source, Target>,
        rhs: Lens<Target, NewTarget>
    ) -> Traversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Composes a Traversal with a Prism.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: A Traversal resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: Traversal<Source, Target>,
        rhs: Prism<Target, NewTarget>
    ) -> Traversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
    
    /// Composes a Traversal with an AffineTraversal.
    /// - Parameters:
    ///   - lhs: Left-hand side of the composition.
    ///   - rhs: Right-hand side of the composition.
    /// - Returns: A Traversal resulting from the sequential application of the two provided optics.
    public static func +<NewTarget>(
        lhs: Traversal<Source, Target>,
        rhs: AffineTraversal<Target, NewTarget>
    ) -> Traversal<Source, NewTarget> {
        lhs.compose(rhs)
    }
}

public extension WritableKeyPath {
    /// Obtains a Traversal focused on each element of the Array targeted by this key path.
    ///
    /// - Returns: A Traversal focused on each element of the Array targeted by this key path.
    func traversal<Element>() -> Traversal<Root, Element> where Value == [Element] {
        Traversal { source, transform in
            var copy = source
            copy[keyPath: self] = source[keyPath: self].map(transform)
            return copy
        }
    }
    
    /// Obtains a Traversal focused on each element of the Array targeted by this key path.
    ///
    /// - Returns: A Traversal focused on each element of the Array targeted by this key path.
    func each<Element>() -> Traversal<Root, Element> where Value == [Element] {
        traversal()
    }
    
    /// Obtains a Traversal focused on each element of the NonEmptyArray targeted by this key path.
    ///
    /// - Returns: A Traversal focused on each element of the NonEmptyArray targeted by this key path.
    func traversal<Element>() -> Traversal<Root, Element> where Value == NEA<Element> {
        Traversal { source, transform in
            var copy = source
            copy[keyPath: self] = source[keyPath: self].map(transform)
            return copy
        }
    }
    
    /// Obtains a Traversal focused on each element of the NonEmptyArray targeted by this key path.
    ///
    /// - Returns: A Traversal focused on each element of the NonEmptyArray targeted by this key path.
    func each<Element>() -> Traversal<Root, Element> where Value == NEA<Element> {
        traversal()
    }
}
