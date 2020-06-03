public extension Optional {
    func mapFilter<A>(_ f: @escaping (Wrapped) -> A?) -> A? {
        self.flatMap(f)
    }
    
    func filter(_ f: @escaping (Wrapped) -> Bool) -> Wrapped? {
        mapFilter { wrapped in
            f(wrapped) ? wrapped : nil
        }
    }
}
