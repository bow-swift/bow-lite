public extension Array {
    static func lift<B>(_ f: @escaping (Element) -> B) -> (Array<Element>) -> Array<B> {
        { array in array.map(f) }
    }
    
    func `as`<B>(_ b: B) -> Array<B> {
        self.map(constant(b))
    }
    
    func void() -> Array<Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Element) -> B) -> Array<(Element, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> Array<(B, Element)> {
        self.map { a in (b, a) }
    }
    
    func tupleElement<B>(_ b: B) -> Array<(Element, B)> {
        self.map { a in (a, b) }
    }
}
