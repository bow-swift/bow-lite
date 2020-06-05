public extension NonEmptyArray {
    // MARK: Traverse for Optional
    
    func traverse<A>(_ f: @escaping (Element) -> A?) -> [A]? {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    func sequence<A>() -> [A]? where Element == A? {
        traverse(id)
    }
    
    func flatTraverse<A>(_ f: @escaping (Element) -> [A]?) -> [A]? {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Either
    
    func traverse<L, A>(_ f: @escaping (Element) -> Either<L, A>) -> Either<L, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    func sequence<L, A>() -> Either<L, [A]> where Element == Either<L, A> {
        traverse(id)
    }
    
    func flatTraverse<L, A>(_ f: @escaping (Element) -> Either<L, [A]>) -> Either<L, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Const
    
    func traverse<C: Monoid, A>(_ f: @escaping (Element) -> Const<C, A>) -> Const<C, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    func sequence<C: Monoid, A>() -> Const<C, [A]> where Element == Const<C, A> {
        traverse(id)
    }
    
    func flatTraverse<C: Monoid, A>(_ f: @escaping (Element) -> Const<C, [A]>) -> Const<C, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Id
    
    func traverse<A>(_ f: @escaping (Element) -> Id<A>) -> Id<[A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    func sequence<A>() -> Id<[A]> where Element == Id<A> {
        traverse(id)
    }
    
    func flatTraverse<A>(_ f: @escaping (Element) -> Id<[A]>) -> Id<[A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Function
    
    func traverse<I, A>(_ f: @escaping (Element) -> Function<I, A>) -> Function<I, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    func sequence<I, A>() -> Function<I, [A]> where Element == Function<I, A> {
        traverse(id)
    }
    
    func flatTraverse<I, A>(_ f: @escaping (Element) -> Function<I, [A]>) -> Function<I, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Ior
    
    func traverse<L: Monoid, A>(_ f: @escaping (Element) -> Ior<L, A>) -> Ior<L, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    func sequence<L: Monoid, A>() -> Ior<L, [A]> where Element == Ior<L, A> {
        traverse(id)
    }
    
    func flatTraverse<L: Monoid, A>(_ f: @escaping (Element) -> Ior<L, [A]>) -> Ior<L, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Result
    
    func traverse<E: Error, A>(_ f: @escaping (Element) -> Result<A, E>) -> Result<[A], E> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    func sequence<E: Error, A>() -> Result<[A], E> where Element == Result<A, E> {
        traverse(id)
    }
    
    func flatTraverse<E: Error, A>(_ f: @escaping (Element) -> Result<[A], E>) -> Result<[A], E> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for State
    
    func traverse<S, A>(_ f: @escaping (Element) -> State<S, A>) -> State<S, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    func sequence<S, A>() -> State<S, [A]> where Element == State<S, A> {
        traverse(id)
    }
    
    func flatTraverse<S, A>(_ f: @escaping (Element) -> State<S, [A]>) -> State<S, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Store
    
    func traverse<S: Monoid, A>(_ f: @escaping (Element) -> Store<S, A>) -> Store<S, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    func sequence<S: Monoid, A>() -> Store<S, [A]> where Element == Store<S, A> {
        traverse(id)
    }
    
    func flatTraverse<S: Monoid, A>(_ f: @escaping (Element) -> Store<S, [A]>) -> Store<S, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Try
    
    func traverse<A>(_ f: @escaping (Element) -> Try<A>) -> Try<[A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    func sequence<A>() -> Try<[A]> where Element == Try<A> {
        traverse(id)
    }
    
    func flatTraverse<A>(_ f: @escaping (Element) -> Try<[A]>) -> Try<[A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Validated
    
    func traverse<I: Semigroup, A>(_ f: @escaping (Element) -> Validated<I, A>) -> Validated<I, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    func sequence<I: Semigroup, A>() -> Validated<I, [A]> where Element == Validated<I, A> {
        traverse(id)
    }
    
    func flatTraverse<I: Semigroup, A>(_ f: @escaping (Element) -> Validated<I, [A]>) -> Validated<I, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Writer
    
    func traverse<W: Monoid, A>(_ f: @escaping (Element) -> Writer<W, A>) -> Writer<W, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    func sequence<W: Monoid, A>() -> Writer<W, [A]> where Element == Writer<W, A> {
        traverse(id)
    }
    
    func flatTraverse<W: Monoid, A>(_ f: @escaping (Element) -> Writer<W, [A]>) -> Writer<W, [A]> {
        traverse(f).map { array in array.flatten() }
    }
}
