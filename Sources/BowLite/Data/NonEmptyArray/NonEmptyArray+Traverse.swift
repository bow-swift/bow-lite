public extension NonEmptyArray {
    // MARK: Traverse for Optional
    
    func traverse<A>(_ f: @escaping (Element) -> A?) -> NEA<A>? {
        self.asArray.traverse(f).map(NEA.init(unsafe:))
    }
    
    func sequence<A>() -> NEA<A>? where Element == A? {
        traverse(id)
    }
    
    func flatTraverse<A>(_ f: @escaping (Element) -> NEA<A>?) -> NEA<A>? {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Either
    
    func traverse<L, A>(_ f: @escaping (Element) -> Either<L, A>) -> Either<L, NEA<A>> {
        self.asArray.traverse(f).map(NEA.init(unsafe:))
    }
    
    func sequence<L, A>() -> Either<L, NEA<A>> where Element == Either<L, A> {
        traverse(id)
    }
    
    func flatTraverse<L, A>(_ f: @escaping (Element) -> Either<L, NEA<A>>) -> Either<L, NEA<A>> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Const
    
    func traverse<C: Monoid, A>(_ f: @escaping (Element) -> Const<C, A>) -> Const<C, NEA<A>> {
        self.asArray.traverse(f).map(NEA.init(unsafe:))
    }
    
    func sequence<C: Monoid, A>() -> Const<C, NEA<A>> where Element == Const<C, A> {
        traverse(id)
    }
    
    func flatTraverse<C: Monoid, A>(_ f: @escaping (Element) -> Const<C, NEA<A>>) -> Const<C, NEA<A>> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Id
    
    func traverse<A>(_ f: @escaping (Element) -> Id<A>) -> Id<NEA<A>> {
        self.asArray.traverse(f).map(NEA.init(unsafe:))
    }
    
    func sequence<A>() -> Id<NEA<A>> where Element == Id<A> {
        traverse(id)
    }
    
    func flatTraverse<A>(_ f: @escaping (Element) -> Id<NEA<A>>) -> Id<NEA<A>> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Function
    
    func traverse<I, A>(_ f: @escaping (Element) -> Function<I, A>) -> Function<I, NEA<A>> {
        self.asArray.traverse(f).map(NEA.init(unsafe:))
    }
    
    func sequence<I, A>() -> Function<I, NEA<A>> where Element == Function<I, A> {
        traverse(id)
    }
    
    func flatTraverse<I, A>(_ f: @escaping (Element) -> Function<I, NEA<A>>) -> Function<I, NEA<A>> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Ior
    
    func traverse<L: Monoid, A>(_ f: @escaping (Element) -> Ior<L, A>) -> Ior<L, NEA<A>> {
        self.asArray.traverse(f).map(NEA.init(unsafe:))
    }
    
    func sequence<L: Monoid, A>() -> Ior<L, NEA<A>> where Element == Ior<L, A> {
        traverse(id)
    }
    
    func flatTraverse<L: Monoid, A>(_ f: @escaping (Element) -> Ior<L, NEA<A>>) -> Ior<L, NEA<A>> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Result
    
    func traverse<E: Error, A>(_ f: @escaping (Element) -> Result<A, E>) -> Result<NEA<A>, E> {
        self.asArray.traverse(f).map(NEA.init(unsafe:))
    }
    
    func sequence<E: Error, A>() -> Result<NEA<A>, E> where Element == Result<A, E> {
        traverse(id)
    }
    
    func flatTraverse<E: Error, A>(_ f: @escaping (Element) -> Result<NEA<A>, E>) -> Result<NEA<A>, E> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for State
    
    func traverse<S, A>(_ f: @escaping (Element) -> State<S, A>) -> State<S, NEA<A>> {
        self.asArray.traverse(f).map(NEA.init(unsafe:))
    }
    
    func sequence<S, A>() -> State<S, NEA<A>> where Element == State<S, A> {
        traverse(id)
    }
    
    func flatTraverse<S, A>(_ f: @escaping (Element) -> State<S, NEA<A>>) -> State<S, NEA<A>> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Store
    
    func traverse<S: Monoid, A>(_ f: @escaping (Element) -> Store<S, A>) -> Store<S, NEA<A>> {
        self.asArray.traverse(f).map(NEA.init(unsafe:))
    }
    
    func sequence<S: Monoid, A>() -> Store<S, NEA<A>> where Element == Store<S, A> {
        traverse(id)
    }
    
    func flatTraverse<S: Monoid, A>(_ f: @escaping (Element) -> Store<S, NEA<A>>) -> Store<S, NEA<A>> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Try
    
    func traverse<A>(_ f: @escaping (Element) -> Try<A>) -> Try<NEA<A>> {
        self.asArray.traverse(f).map(NEA.init(unsafe:))
    }
    
    func sequence<A>() -> Try<NEA<A>> where Element == Try<A> {
        traverse(id)
    }
    
    func flatTraverse<A>(_ f: @escaping (Element) -> Try<NEA<A>>) -> Try<NEA<A>> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Validated
    
    func traverse<I: Semigroup, A>(_ f: @escaping (Element) -> Validated<I, A>) -> Validated<I, NEA<A>> {
        self.asArray.traverse(f).map(NEA.init(unsafe:))
    }
    
    func sequence<I: Semigroup, A>() -> Validated<I, NEA<A>> where Element == Validated<I, A> {
        traverse(id)
    }
    
    func flatTraverse<I: Semigroup, A>(_ f: @escaping (Element) -> Validated<I, NEA<A>>) -> Validated<I, NEA<A>> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Writer
    
    func traverse<W: Monoid, A>(_ f: @escaping (Element) -> Writer<W, A>) -> Writer<W, NEA<A>> {
        self.asArray.traverse(f).map(NEA.init(unsafe:))
    }
    
    func sequence<W: Monoid, A>() -> Writer<W, NEA<A>> where Element == Writer<W, A> {
        traverse(id)
    }
    
    func flatTraverse<W: Monoid, A>(_ f: @escaping (Element) -> Writer<W, NEA<A>>) -> Writer<W, NEA<A>> {
        traverse(f).map { array in array.flatten() }
    }
}
