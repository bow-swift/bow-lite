public extension Array {
    func flatten<A>() -> Array<A> where Element == Array<A> {
        self.flatMap(id)
    }
    
    func followedBy<A>(_ fa: Array<A>) -> Array<A> {
        self.flatMap(constant(fa))
    }
    
    func forEffect<A>(_ fa: Array<A>) -> Array<Element> {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    func mproduct<A>(_ f: @escaping (Element) -> Array<A>) -> Array<(Element, A)> {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    func `if`<A>(
        then f: @escaping () -> Array<A>,
        else g: @escaping () -> Array<A>
    ) -> Array<A> where Element == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    func flatTap<A>(_ f: @escaping (Element) -> Array<A>) -> Array<Element> {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
