public extension NonEmptyArray {
    func compactMap<A>(_ f: @escaping (Element) -> A?) -> NEA<A> {
        NEA(unsafe: self.asArray.compactMap(f))
    }
    
    func mapFilter<A>(_ f: @escaping (Element) -> A?) -> NEA<A> {
        self.compactMap(f)
    }
    
    func flattenOptional<A>() -> NEA<A> where Element == A? {
        mapFilter(id)
    }
}
