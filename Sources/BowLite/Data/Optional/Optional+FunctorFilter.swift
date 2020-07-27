public extension Optional {
    /// Maps the value/s in this context, filtering out the ones resulting in `nil`.
    ///
    /// - Parameters:
    ///   - f: A function to map objects and filter them out.
    /// - Returns: Transformed and filtered values, in this context.
    func mapFilter<A>(_ f: @escaping (Wrapped) -> A?) -> A? {
        self.flatMap(f)
    }
    
    /// Filters out values that do not match a predicate.
    ///
    /// - Parameter f: Filtering predicate.
    /// - Returns: An optional value that contains the original value if it matched the predicate, or nil, otherwise.
    func filter(_ f: @escaping (Wrapped) -> Bool) -> Wrapped? {
        mapFilter { wrapped in
            f(wrapped) ? wrapped : nil
        }
    }
}
