public extension Array {
    func parTraverse<Failure, Success>(
        _ f: @escaping (Element) -> IO<Failure, Success>
    ) -> IO<Failure, [Success]> {
        self.reduce(.pure([])) { partial, next in
            .parMap(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    func parSequence<Failure, Success>() -> IO<Failure, [Success]> where Element == IO<Failure, Success> {
        parTraverse(id)
    }
    
    func parFlatTraverse<Failure, Success>(
        _ f: @escaping (Element) -> IO<Failure, [Success]>
    ) -> IO<Failure, [Success]> {
        parTraverse(f).map { array in array.flatten() }
    }
}
