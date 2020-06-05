public extension NonEmptyArray {
    func reduce<B>(
        _ initialValue: B,
        _ combine: @escaping (B, Element) -> B
    ) -> B {
        self.asArray.reduce(initialValue, combine)
    }
    
    func foldLeft<B>(
        _ initialValue: B,
        _ combine: @escaping (B, Element) -> B
    ) -> B {
        self.reduce(initialValue, combine)
    }
    
    func reduceLeftToOptional<B>(
        _ transform: @escaping (Element) -> B,
        _ combine: @escaping (B, Element) -> B
    ) -> B? {
        self.reduce(nil) { partial, next in
            partial.fold(
                { transform(next) },
                { result in combine(result, next) }
            )
        }
    }
    
    func reduceLeftOptional(
        _ combine: @escaping (Element, Element) -> Element
    ) -> Element? {
        reduceLeftToOptional(id, combine)
    }
    
    func foldMap<B: Monoid>(
        _ transform: @escaping (Element) -> B
    ) -> B {
        self.reduce(B.empty) { partial, next in
            partial.combine(transform(next))
        }
    }
    
    func find(_ predicate: @escaping (Element) -> Bool) -> Element? {
        self.reduce(nil) { partial, next in
            partial.fold(
                { predicate(next) ? next : nil },
                id)
        }
    }
    
    func exists(_ predicate: @escaping (Element) -> Bool) -> Bool {
        self.reduce(false) { partial, next in
            partial || predicate(next)
        }
    }
    
    func forAll(_ predicate: @escaping (Element) -> Bool) -> Bool {
        self.reduce(true) { partial, next in
            partial && predicate(next)
        }
    }
}

public extension NonEmptyArray where Element: Monoid {
    func fold() -> Element {
        self.reduce(Element.empty, Element.combine)
    }
    
    func combineAll() -> Element {
        fold()
    }
}
