public extension NonEmptyArray {
    func parTraverse<Failure, Success>(
        _ f: @escaping (Element) -> IO<Failure, Success>
    ) -> IO<Failure, NEA<Success>> {
        self.asArray.parTraverse(f).map(NEA.init(unsafe:))
    }
    
    func parSequence<Failure, Success>() -> IO<Failure, NEA<Success>> where Element == IO<Failure, Success> {
        parTraverse(id)
    }
    
    func parFlatTraverse<Failure, Success>(
        _ f: @escaping (Element) -> IO<Failure, NEA<Success>>
    ) -> IO<Failure, NEA<Success>> {
        parTraverse(f).map { array in array.flatten() }
    }
}
