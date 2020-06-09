public struct Traversal<Source, Target> {
    public let modify: (Source, @escaping (Target) -> Target) -> Source
    
    public init(modify: @escaping (Source, @escaping (Target) -> Target) -> Source) {
        self.modify = modify
    }
    
    public func set(
        _ source: Source,
        _ newElement: Target
    ) -> Source {
        modify(source, constant(newElement))
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
}

public extension WritableKeyPath {
    func traversal<Element>() -> Traversal<Root, Element> where Value == [Element] {
        Traversal { source, transform in
            var copy = source
            copy[keyPath: self] = source[keyPath: self].map(transform)
            return copy
        }
    }
    
    func each<Element>() -> Traversal<Root, Element> where Value == [Element] {
        traversal()
    }
    
    func traversal<Element>() -> Traversal<Root, Element> where Value == NEA<Element> {
        Traversal { source, transform in
            var copy = source
            copy[keyPath: self] = source[keyPath: self].map(transform)
            return copy
        }
    }
    
    func each<Element>() -> Traversal<Root, Element> where Value == NEA<Element> {
        traversal()
    }
}
