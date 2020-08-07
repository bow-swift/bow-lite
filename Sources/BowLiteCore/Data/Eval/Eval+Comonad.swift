public extension Eval {
    /// Wraps a value in another layer of this context.
    ///
    /// - Returns: Value wrapped in another context layer.
    func duplicate() -> Eval<Eval<Value>> {
        coflatMap(id)
    }
}
