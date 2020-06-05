public extension NonEmptyArray {
    func map<B>(_ f: @escaping (Element) -> B) -> NonEmptyArray<B> {
        NEA(unsafe: self.asArray.map(f))
    }
    
    static func lift<B>(_ f: @escaping (Element) -> B) -> (NonEmptyArray<Element>) -> NonEmptyArray<B> {
        { array in array.map(f) }
    }
    
    func `as`<B>(_ b: B) -> NonEmptyArray<B> {
        self.map(constant(b))
    }
    
    func void() -> NonEmptyArray<Void> {
        self.as(())
    }
    
    func product<B>(_ f: @escaping (Element) -> B) -> NonEmptyArray<(Element, B)> {
        self.map { a in (a, f(a)) }
    }
    
    func tupleLeft<B>(_ b: B) -> NonEmptyArray<(B, Element)> {
        self.map { a in (b, a) }
    }
    
    func tupleElement<B>(_ b: B) -> NonEmptyArray<(Element, B)> {
        self.map { a in (a, b) }
    }
}
