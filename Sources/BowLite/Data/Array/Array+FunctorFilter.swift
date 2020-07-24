public extension Array {
    /// Maps the value/s in this context, filtering out the ones resulting in `nil`.
    ///
    /// - Parameters:
    ///   - f: A function to map objects and filter them out.
    /// - Returns: Transformed and filtered values, in this context.
    func mapFilter<A>(_ f: @escaping (Element) -> A?) -> [A] {
        self.compactMap(f)
    }
    
    /// Removes the `nil` value/s in this context and extracts the present ones.
    ///
    /// - Returns: Plain values in this context.
    func flattenOptional<A>() -> [A] where Element == A? {
        mapFilter(id)
    }
}
