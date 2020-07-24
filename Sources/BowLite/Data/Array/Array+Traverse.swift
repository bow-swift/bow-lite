public extension Array {
    // MARK: Traverse for Optional
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<A>(_ f: @escaping (Element) -> A?) -> [A]? {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<A>() -> [A]? where Element == A? {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<A>(_ f: @escaping (Element) -> [A]?) -> [A]? {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Either
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<L, A>(_ f: @escaping (Element) -> Either<L, A>) -> Either<L, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<L, A>() -> Either<L, [A]> where Element == Either<L, A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<L, A>(_ f: @escaping (Element) -> Either<L, [A]>) -> Either<L, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Const
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<C: Monoid, A>(_ f: @escaping (Element) -> Const<C, A>) -> Const<C, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<C: Monoid, A>() -> Const<C, [A]> where Element == Const<C, A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<C: Monoid, A>(_ f: @escaping (Element) -> Const<C, [A]>) -> Const<C, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Id
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<A>(_ f: @escaping (Element) -> Id<A>) -> Id<[A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<A>() -> Id<[A]> where Element == Id<A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<A>(_ f: @escaping (Element) -> Id<[A]>) -> Id<[A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Function
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<I, A>(_ f: @escaping (Element) -> Function<I, A>) -> Function<I, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<I, A>() -> Function<I, [A]> where Element == Function<I, A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<I, A>(_ f: @escaping (Element) -> Function<I, [A]>) -> Function<I, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Ior
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<L: Monoid, A>(_ f: @escaping (Element) -> Ior<L, A>) -> Ior<L, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<L: Monoid, A>() -> Ior<L, [A]> where Element == Ior<L, A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<L: Monoid, A>(_ f: @escaping (Element) -> Ior<L, [A]>) -> Ior<L, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Result
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<E: Error, A>(_ f: @escaping (Element) -> Result<A, E>) -> Result<[A], E> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<E: Error, A>() -> Result<[A], E> where Element == Result<A, E> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<E: Error, A>(_ f: @escaping (Element) -> Result<[A], E>) -> Result<[A], E> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for State
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<S, A>(_ f: @escaping (Element) -> State<S, A>) -> State<S, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<S, A>() -> State<S, [A]> where Element == State<S, A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<S, A>(_ f: @escaping (Element) -> State<S, [A]>) -> State<S, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Store
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<S: Monoid, A>(_ f: @escaping (Element) -> Store<S, A>) -> Store<S, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<S: Monoid, A>() -> Store<S, [A]> where Element == Store<S, A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<S: Monoid, A>(_ f: @escaping (Element) -> Store<S, [A]>) -> Store<S, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Try
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<A>(_ f: @escaping (Element) -> Try<A>) -> Try<[A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<A>() -> Try<[A]> where Element == Try<A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<A>(_ f: @escaping (Element) -> Try<[A]>) -> Try<[A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Validated
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<I: Semigroup, A>(_ f: @escaping (Element) -> Validated<I, A>) -> Validated<I, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<I: Semigroup, A>() -> Validated<I, [A]> where Element == Validated<I, A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<I: Semigroup, A>(_ f: @escaping (Element) -> Validated<I, [A]>) -> Validated<I, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Writer
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<W: Monoid, A>(_ f: @escaping (Element) -> Writer<W, A>) -> Writer<W, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<W: Monoid, A>() -> Writer<W, [A]> where Element == Writer<W, A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<W: Monoid, A>(_ f: @escaping (Element) -> Writer<W, [A]>) -> Writer<W, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for Eval
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<A>(_ f: @escaping (Element) -> Eval<A>) -> Eval<[A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<A>() -> Eval<[A]> where Element == Eval<A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<A>(_ f: @escaping (Element) -> Eval<[A]>) -> Eval<[A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for IO
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<E: Error, A>(_ f: @escaping (Element) -> IO<E, A>) -> IO<E, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<E: Error, A>() -> IO<E, [A]> where Element == IO<E, A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<E: Error, A>(_ f: @escaping (Element) -> IO<E, [A]>) -> IO<E, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for EnvIO
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<D, E: Error, A>(_ f: @escaping (Element) -> EnvIO<D, E, A>) -> EnvIO<D, E, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<D, E: Error, A>() -> EnvIO<D, E, [A]> where Element == EnvIO<D, E, A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<D, E: Error, A>(_ f: @escaping (Element) -> EnvIO<D, E, [A]>) -> EnvIO<D, E, [A]> {
        traverse(f).map { array in array.flatten() }
    }
}
