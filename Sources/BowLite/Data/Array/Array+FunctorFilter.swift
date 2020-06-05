public extension Array {
    func mapFilter<A>(_ f: @escaping (Element) -> A?) -> [A] {
        self.compactMap(f)
    }
    
    func flattenOptional<A>() -> [A] where Element == A? {
        mapFilter(id)
    }
}
