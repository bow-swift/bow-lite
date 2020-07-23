public extension Eval {
    func duplicate() -> Eval<Eval<Value>> {
        coflatMap(id)
    }
}
