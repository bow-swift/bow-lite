public extension NonEmptyArray {
    /// Maps the value/s in this context, filtering out the ones resulting in `nil`.
    ///
    /// - Parameters:
    ///   - f: A function to map objects and filter them out.
    /// - Returns: Transformed and filtered values, in this context.
    func compactMap<A>(_ f: @escaping (Element) -> A?) -> NEA<A> {
        NEA(unsafe: self.asArray.compactMap(f))
    }
    
    /// Maps the value/s in this context, filtering out the ones resulting in `nil`.
    ///
    /// - Parameters:
    ///   - f: A function to map objects and filter them out.
    /// - Returns: Transformed and filtered values, in this context.
    func mapFilter<A>(_ f: @escaping (Element) -> A?) -> NEA<A> {
        self.compactMap(f)
    }
    
    /// Removes the `nil` value/s in this context and extracts the present ones.
    ///
    /// - Returns: Plain values in this context.
    func flattenOptional<A>() -> NEA<A> where Element == A? {
        mapFilter(id)
    }
}
