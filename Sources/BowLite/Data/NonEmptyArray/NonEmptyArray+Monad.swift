public extension NonEmptyArray {
    func flatMap<A>(_ f: @escaping (Element) -> NonEmptyArray<A>) -> NonEmptyArray<A> {
        NEA(unsafe: self.asArray.flatMap { x in f(x).asArray })
    }
    
    func flatten<A>() -> NonEmptyArray<A> where Element == NonEmptyArray<A> {
        self.flatMap(id)
    }
    
    func followedBy<A>(_ fa: NonEmptyArray<A>) -> NonEmptyArray<A> {
        self.flatMap(constant(fa))
    }
    
    func forEffect<A>(_ fa: NonEmptyArray<A>) -> NonEmptyArray<Element> {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    func mproduct<A>(_ f: @escaping (Element) -> NonEmptyArray<A>) -> NonEmptyArray<(Element, A)> {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    func `if`<A>(
        then f: @escaping () -> NonEmptyArray<A>,
        else g: @escaping () -> NonEmptyArray<A>
    ) -> NonEmptyArray<A> where Element == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    func flatTap<A>(_ f: @escaping (Element) -> NonEmptyArray<A>) -> NonEmptyArray<Element> {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
