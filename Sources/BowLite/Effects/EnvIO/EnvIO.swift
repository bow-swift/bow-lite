import Foundation

/// A RIO is a data type like EnvIO with no explicit error type, resorting to the `Error` protocol to handle them.
public typealias RIO<Dependencies, Success> = EnvIO<Dependencies, Error, Success>

/// An URIO is a data type like EnvIO that never fails; i.e. it never produces errors.
public typealias URIO<Dependencies, Success> = EnvIO<Dependencies, Never, Success>

/// EnvIO is a data type to perform IO operations that produce errors of type `Failure` or values of type `Success`, having access to an immutable environment of type `Dependencies`. It can be seen as a Kleisli function `(Dependencies) -> IO<Failure, Success>`.
public struct EnvIO<Dependencies, Failure: Error, Success> {
    /// Wrapped side-effectful Kleisli function.
    public let run: (Dependencies) -> IO<Failure, Success>
    
    /// Initializes an instance of this type.
    ///
    /// - Parameter run: Side-effectful Kleisli function.
    public init(_ run: @escaping (Dependencies) -> IO<Failure, Success>) {
        self.run = run
    }
    
    /// Creates an EnvIO from a side-effectful function.
    ///
    /// - Parameter f: Side-effectful function. Errors thrown from this function must be of type Failure; otherwise, a fatal error will happen.
    /// - Returns: An EnvIO suspending the execution of the side effect.
    public static func invoke(_ f: @escaping (Dependencies) throws -> Success) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.invoke {
                try f(dependencies)
            }
        }
    }
    
    /// Creates an EnvIO from a side-effectful function.
    ///
    /// - Parameter f: Side-effectful function returning an `Either`. Errors thrown from this function must be of type `Failure`; otherwise, a fatal error will happen.
    /// - Returns: An EnvIO suspending the execution of the side effect.
    public static func invokeEither(_ f: @escaping (Dependencies) -> Either<Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.invokeEither {
                f(dependencies)
            }
        }
    }
    
    /// Creates an EnvIO from a side-effectful function.
    ///
    /// - Parameter f: Side-effectful function returning a `Result`. Errors thrown from this function must be of type `Failure`; otherwise, a fatal error will happen.
    /// - Returns: An EnvIO suspending the execution of the side effect.
    public static func invokeResult(_ f: @escaping (Dependencies) -> Result<Success, Failure>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.invokeResult {
                f(dependencies)
            }
        }
    }
    
    /// Creates an EnvIO from a side-effectful function.
    ///
    /// - Parameter f: Side-effectful function returning an `Validated`. Errors thrown from this function must be of type `Failure`; otherwise, a fatal error will happen.
    /// - Returns: An EnvIO suspending the execution of the side effect.
    public static func invokeValidated(_ f: @escaping (Dependencies) -> Validated<Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.invokeValidated {
                f(dependencies)
            }
        }
    }
    
    /// Creates a constant Kleisli function.
    ///
    /// - Parameter io: Constant value to return.
    /// - Returns: A constant EnvIO function.
    public static func liftF(_ io: IO<Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { _ in io }
    }
    
    /// Accesses the environment to produce a Kleisli effect.
    ///
    /// - Parameter f: Function accessing the environment.
    /// - Returns: A Kleisli function wraping the produced value.
    public static func accessM(_ f: @escaping (Dependencies) -> EnvIO<Dependencies, Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO<Dependencies, Failure, Dependencies>.ask().flatMap(f)
    }
    
    /// Accesses the environment to produce a pure value.
    ///
    /// - Parameter f: Function accessing the environment.
    /// - Returns: A Kleisli function wrapping the produced value.
    public static func access(_ f: @escaping (Dependencies) -> Success) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.pure(f(dependencies))
        }
    }
    
    /// Lifts a value to the this context type.
    ///
    /// - Parameter success: Value to be lifted.
    /// - Returns: Provided value in this context type.
    public static func pure(_ success: Success) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { _ in IO.pure(success) }
    }
    
    /// Lifts an error to this context.
    ///
    /// - Parameter failure: A value of the error type.
    /// - Returns: A value representing the error in this context.
    public static func raiseError(_ failure: Failure) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { _ in IO.raiseError(failure) }
    }
    
    /// Provides the required environment.
    ///
    /// - Parameter dependencies: Environment.
    /// - Returns: An IO resulting from running this computation with the provided environment.
    public func provide(_ dependencies: Dependencies) -> IO<Failure, Success> {
        self.run(dependencies)
    }
    
    /// Inkoves this EnvIO function with an input value.
    ///
    /// - Parameter value: Input to the function.
    /// - Returns: Output of the EnvIO.
    public func callAsFunction(_ dependencies: Dependencies) -> IO<Failure, Success> {
        self.run(dependencies)
    }
    
    /// Pre-composes this Kleisli function with a function transforming the input type.
    ///
    /// - Parameter f: Transforming function.
    /// - Returns: Composition of the two functions.
    public func contramap<D>(_ f: @escaping (D) -> Dependencies) -> EnvIO<D, Failure, Success> {
        EnvIO<D, Failure, Success>(f >>> self.run)
    }
    
    /// Transforms the error type of this EnvIO.
    ///
    /// - Parameter f: Function transforming the error.
    /// - Returns: An EnvIO value with the new error type.
    public func mapError<E: Error>(_ f: @escaping (Failure) -> E) -> EnvIO<Dependencies, E, Success> {
        EnvIO<Dependencies, E, Success> { dependencies in
            self.run(dependencies).mapError(f)
        }
    }
    
    /// Transforms the result of this Kleisli function.
    ///
    /// - Parameter f: Transforming function.
    /// - Returns: A Kleisli function that behaves as the original one, with its result transformed.
    public func transformT<E: Error, A>(_ f: @escaping (IO<Failure, Success>) -> IO<E, A>) -> EnvIO<Dependencies, E, A> {
        EnvIO<Dependencies, E, A>(self.run >>> f)
    }
    
    /// Creates a new value transforming this type using the provided function, preserving the structure of the original type.
    ///
    /// The implementation of this function must obey two laws:
    ///
    /// 1. Preserve identity:
    ///
    ///         map(fa, id) == fa
    ///
    /// 2. Preserve composition:
    ///
    ///         map(map(fa, f), g) == map(fa, compose(g, f))
    ///
    /// - Parameters:
    ///   - f: A transforming function.
    /// - Returns: The result of transforming the value type using the provided function, maintaining the structure of the original value.
    public func map<B>(_ f: @escaping (Success) -> B) -> EnvIO<Dependencies, Failure, B> {
        EnvIO<Dependencies, Failure, B> { dependencies in
            self.run(dependencies).map(f)
        }
    }
    
    /// Handles an error, potentially recovering from it by mapping it to a value in this context.
    ///
    /// - Parameters:
    ///   - f: A recovery function.
    /// - Returns: A value where the possible errors have been recovered using the provided function.
    public func handleErrorWith(_ f: @escaping (Failure) -> EnvIO<Dependencies, Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            self.run(dependencies).handleErrorWith { error in
                f(error).run(dependencies)
            }
        }
    }
    
    /// Transforms the type arguments of this EnvIO.
    ///
    /// - Parameters:
    ///   - f: Function to transform the error type argument.
    ///   - g: Function to transform the output type argument.
    /// - Returns: An EnvIO with both type arguments transformed.
    public func bimap<E: Error, B>(
        _ f: @escaping (Failure) -> E,
        _ g: @escaping (Success) -> B
    ) -> EnvIO<Dependencies, E, B> {
        self.mapError(f).map(g)
    }
    
    /// Pre- and post- composes this function with the provided arguments.
    ///
    /// - Parameters:
    ///   - pre: Function to pre-compose with this function.
    ///   - post: Function to post-compose with this function.
    /// - Returns: Result of composing the three functions.
    public func dimap<D, B>(
        _ pre: @escaping (D) -> Dependencies,
        _ post: @escaping (Success) -> B
    ) -> EnvIO<D, Failure, B> {
        self.contramap(pre).map(post)
    }
    
    /// Zips this EnvIO function with another one with the same input type.
    ///
    /// - Parameter other: Kleisli function to be zipped with this one.
    /// - Returns: A Kleisli function that pairs the output of the two Kleisli functions zipped in this operation.
    public func zip<B>(_ other: EnvIO<Dependencies, Failure, B>) -> EnvIO<Dependencies, Failure, (Success, B)> {
        EnvIO<Dependencies, Failure, (Success, B)>.zip(self, other)
    }
    
    /// Sequentially compose two computations, passing any value produced by the first as an argument to the second.
    ///
    /// - Parameters:
    ///   - f: A function describing the second computation, which depends on the value of the first.
    /// - Returns: Result of composing the two computations.
    public func flatMap<B>(_ f: @escaping (Success) -> EnvIO<Dependencies, Failure, B>) -> EnvIO<Dependencies, Failure, B> {
        EnvIO<Dependencies, Failure, B> { dependencies in
            self.run(dependencies).flatMap { success in
                f(success).run(dependencies)
            }
        }
    }
    
    /// Composes this EnvIO with another.
    ///
    /// - Parameter f: An EnvIO function to be composed after this.
    /// - Returns: An EnvIO function that is equivalent to running this and then the received one.
    public func andThen<B>(_ f: EnvIO<Success, Failure, B>) -> EnvIO<Dependencies, Failure, B> {
        EnvIO<Dependencies, Failure, B> { dependencies in
            self.run(dependencies).flatMap { success in
                f.run(success)
            }
        }
    }
    
    /// Composes this EnvIO with a function in Kleisli form.
    ///
    /// - Parameter f: A function to be composed after this EnvIO.
    /// - Returns: An EnvIO function that is equivalent to running this and then the received one.
    public func andThen<B>(_ f: @escaping (Success) -> IO<Failure, B>) -> EnvIO<Dependencies, Failure, B> {
        andThen(EnvIO<Success, Failure, B>(f))
    }
    
    /// Composes this EnvIO with a constant value.
    ///
    /// - Parameter io: Constant value.
    /// - Returns: An EnvIO function that is equivalent to running this and ommitting its result, returning the constant value produced.
    public func andThen<B>(_ io: IO<Failure, B>) -> EnvIO<Dependencies, Failure, B> {
        andThen(constant(io))
    }
    
    /// Folds over the result of this computation by accepting an effect to execute in case of error, and another one in the case of success.
    ///
    /// - Parameters:
    ///   - f: Function to run in case of error.
    ///   - g: Function to run in case of success.
    /// - Returns: A computation from the result of applying the provided functions to the result of this computation.
    public func foldM<B>(
        _ f: @escaping (Failure) -> EnvIO<Dependencies, Failure, B>,
        _ g: @escaping (Success) -> EnvIO<Dependencies, Failure, B>
    ) -> EnvIO<Dependencies, Failure, B> {
        self.flatMap(g).handleErrorWith(f)
    }
    
    /// Folds over the result of this computation by accepting a function to execute in case of error, and another one in the case of success.
    ///
    /// - Parameters:
    ///   - f: Function to run in case of error.
    ///   - g: Function to run in case of success.
    /// - Returns: A computation from the result of applying the provided functions to the result of this computation.
    public func foldA<B>(
        _ f: @escaping (Failure) -> B,
        _ g: @escaping (Success) -> B
    ) -> EnvIO<Dependencies, Failure, B> {
        foldM(f >>> EnvIO<Dependencies, Failure, B>.pure,
              g >>> EnvIO<Dependencies, Failure, B>.pure)
    }
    
    /// Executes this computation in a modified environment.
    ///
    /// - Parameters:
    ///   - f: Funtion to modify the environment.
    /// - Returns: Computation in the modified environment.
    public func local(_ f: @escaping (Dependencies) -> Dependencies) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO(f >>> self.run)
    }
    
    /// Performs the side effects that are suspended in this IO in a synchronous manner.
    ///
    /// - Parameters:
    ///   - dependencies: Dependencies needed in this operation.
    ///   - queue: Dispatch queue used to execute the side effects. Defaults to the main queue.
    /// - Returns: Value produced after running the suspended side effects.
    /// - Throws: Error of type `Failure` that may happen during the evaluation of the side-effects. Errors of other types thrown from the evaluation of this IO will cause a fatal error.
    public func unsafeRunSync(
        with dependencies: Dependencies,
        on queue: DispatchQueue = .main
    ) throws -> Success {
        try self.run(dependencies).unsafeRunSync(on: queue)
    }
    
    /// Performs the side effects that are suspended in this EnvIO in a synchronous manner.
    ///
    /// - Parameters:
    ///   - dependencies: Dependencies needed in this operation.
    ///   - queue: Dispatch queue used to execute the side effects. Defaults to the main queue.
    /// - Returns: An Either wrapping errors in the left side and values on the right side. Errors of other types thrown from the evaluation of this IO will cause a fatal error.
    public func unsafeRunSyncEither(
        with dependencies: Dependencies,
        on queue: DispatchQueue = .main
    ) -> Either<Failure, Success> {
        self.run(dependencies).unsafeRunSyncEither(on: queue)
    }
    
    /// Performs the side effects that are suspended in this EnvIO in an asynchronous manner.
    ///
    /// - Parameters:
    ///   - dependencies: Dependencies needed in this operation.
    ///   - queue: Dispatch queue used to execute the side effects. Defaults to the main queue.
    ///   - callback: A callback function to receive the results of the evaluation. Errors of other types thrown from the evaluation of this IO will cause a fatal error.
    public func unsafeRunAsync(
        with dependepencies: Dependencies,
        on queue: DispatchQueue = .main,
        _ callback: @escaping Callback<Failure, Success> = { _ in }
    ) {
        self.run(dependepencies).unsafeRunAsync(on: queue, callback)
    }
    
    /// Retries this computation if it fails based on the provided retrial policy.
    ///
    /// This computation will be at least executed once, and if it fails, it will be retried according to the policy.
    ///
    /// - Parameter policy: Retrial policy.
    /// - Returns: A computation that is retried based on the provided policy when it fails.
    func retry<S, O>(_ policy: Schedule<Dependencies, Failure, S, O>) -> EnvIO<Dependencies, Failure, Success> {
        retry(policy, orElse: { e, _ in EnvIO.raiseError(e) })
            .map { x in x.merge() }
    }
    
    /// Retries this computation if it fails based on the provided retrial policy, providing a default computation to handle failures after retrial.
    ///
    /// This computation will be at least executed once, and if it fails, it will be retried according to the policy.
    ///
    /// - Parameters:
    ///   - policy: Retrial policy.
    ///   - orElse: Function to handle errors after retrying.
    /// - Returns: A computation that is retried based on the provided policy when it fails.
    func retry<S, O, B>(
        _ policy: Schedule<Dependencies, Failure, S, O>,
        orElse: @escaping (Failure, O) -> EnvIO<Dependencies, Failure, B>) -> EnvIO<Dependencies, Failure, Either<B, Success>> {
        func loop(_ state: S) -> EnvIO<Dependencies, Failure, Either<B, Success>> {
            self.foldM(
                { err in
                    policy.update(err, state)
                        .mapError { _ in err }
                        .foldM({ _ in orElse(err, policy.extract(err, state)).map(Either<B, Success>.left) },
                               loop)
                    
                },
                { a in EnvIO<Dependencies, Failure, Either<B, Success>>.pure(.right(a)) })
        }
        
        return policy.initial
            .mapError { x in x as! Failure }
            .flatMap(loop)
    }
    
    /// Repeats this computation until the provided repeating policy completes, or until it fails.
    ///
    /// This computation will be at least executed once, and if it succeeds, it will be repeated additional times according to the policy.
    ///
    /// - Parameters:
    ///   - policy: Repeating policy.
    ///   - onUpdateError: A function providing an error in case the policy fails to update properly.
    /// - Returns: A computation that is repeated based on the provided policy when it succeeds.
    func `repeat`<S, O>(
        _ policy: Schedule<Dependencies, Success, S, O>,
        onUpdateError: @escaping () -> Failure = { fatalError("Impossible to update error on repeat.") }) -> EnvIO<Dependencies, Failure, O> {
        self.repeat(policy, onUpdateError: onUpdateError) { e, _ in
            EnvIO<Dependencies, Failure, O>.raiseError(e)
        }.map { x in x.merge() }
    }
    
    /// Repeats this computation until the provided repeating policy completes, or until it fails, with a function to handle potential failures.
    ///
    /// - Parameters:
    ///   - policy: Repeating policy.
    ///   - onUpdateError: A function providing an error in case the policy fails to update properly.
    ///   - orElse: A function to return a computation in case of error.
    /// - Returns: A computation that is repeated based on the provided policy when it succeeds.
    func `repeat`<S, O, B>(
        _ policy: Schedule<Dependencies, Success, S, O>,
        onUpdateError: @escaping () -> Failure = { fatalError("Impossible to update error on repeat.") },
        orElse: @escaping (Failure, O?) -> EnvIO<Dependencies, Failure, B>) -> EnvIO<Dependencies, Failure, Either<B, O>> {
        func loop(_ last: Success, _ state: S) -> EnvIO<Dependencies, Failure, Either<B, O>> {
            policy.update(last, state)
                .mapError { _ in onUpdateError() }
                .foldM(
                    { _ in EnvIO<Dependencies, Failure, Either<B, O>>.pure(.right(policy.extract(last, state))) },
                    { s in
                        self.foldM(
                            { e in orElse(e, policy.extract(last, state)).map(Either.left) },
                            { a in loop(a, s) })
                })
        }
        
        return self.foldM(
            { e in orElse(e, nil).map(Either.left) },
            { a in policy.initial
                .mapError { x in x as! Failure }
                .flatMap { s in loop(a, s) } })
    }
}

public extension EnvIO where Dependencies == Any {
    /// Narrows the scope of the context of this EnvIO from `Any` to a concrete type
    ///
    /// - Returns: A copy of this EnvIO working on a more precise context.
    func narrow<D>() -> EnvIO<D, Failure, Success> {
        self.contramap(id)
    }
    
    /// Performs the side effects that are suspended in this IO in a synchronous manner.
    ///
    /// - Parameter queue: Dispatch queue used to execute the side effects. Defaults to the main queue.
    /// - Returns: Value produced after running the suspended side effects.
    /// - Throws: Error of type `E` that may happen during the evaluation of the side-effects. Errors of other types thrown from the evaluation of this IO will cause a fatal error.
    func unsafeRunSync(
        on queue: DispatchQueue = .main
    ) throws -> Success {
        try self.run(()).unsafeRunSync(on: queue)
    }
    
    /// Performs the side effects that are suspended in this EnvIO in a synchronous manner.
    ///
    /// - Parameter queue: Dispatch queue used to execute the side effects. Defaults to the main queue.
    /// - Returns: An Either wrapping errors in the left side and values on the right side. Errors of other types thrown from the evaluation of this IO will cause a fatal error.
    func unsafeRunSyncEither(
        on queue: DispatchQueue = .main
    ) -> Either<Failure, Success> {
        self.run(()).unsafeRunSyncEither(on: queue)
    }
    
    /// Performs the side effects that are suspended in this EnvIO in an asynchronous manner.
    ///
    /// - Parameters:
    ///   - queue: Dispatch queue used to execute the side effects. Defaults to the main queue.
    ///   - callback: A callback function to receive the results of the evaluation. Errors of other types thrown from the evaluation of this IO will cause a fatal error.
    func unsafeRunAsync(
        on queue: DispatchQueue = .main,
        _ callback: @escaping Callback<Failure, Success> = { _ in }
    ) {
        self.run(()).unsafeRunAsync(on: queue, callback)
    }
}

public extension EnvIO where Success == Dependencies {
    /// Retrieves the shared environment.
    ///
    /// - Returns: Shared environment.
    static func ask() -> EnvIO<Dependencies, Failure, Dependencies> {
        EnvIO { dependencies in IO.pure(dependencies) }
    }
}

public extension EnvIO where Failure == Error {
    /// Creates an EnvIO from a side-effectful function returning a Try that has a dependency.
    ///
    /// - Parameter f: Side-effectful function.
    /// - Returns: An EnvIO value suspending the execution of the side effect.
    static func invokeTry(_ f: @escaping (Dependencies) -> Try<Success>) -> EnvIO<Dependencies, Error, Success> {
        EnvIO { dependencies in
            IO.invokeTry {
                f(dependencies)
            }
        }
    }
}

public extension EnvIO where Success == Void {
    /// Sleep for the specified amount of time.
    ///
    /// - Parameter interval: Time to sleep.
    /// - Returns: A computation that sleeps for the specified amount of time.
    static func sleep(_ interval: TimeInterval) -> EnvIO<Dependencies, Failure, Void> {
        EnvIO { _ in IO.sleep(interval) }
    }
    
    /// Sleep for the specified amount of time.
    ///
    /// - Parameter interval: Time to sleep.
    /// - Returns: A computation that sleeps for the specified amount of time.
    static func sleep(_ interval: DispatchTimeInterval) -> EnvIO<Dependencies, Failure, Void> {
        EnvIO { _ in IO.sleep(interval) }
    }
}

public extension EnvIO {
    /// Provides a computation that evaluates the provided function on every run.
    ///
    /// - Parameter fa: Function returning a computation to be deferred.
    /// - Returns: A computation that defers the execution of the provided function.
    static func `defer`(_ f: @escaping () -> EnvIO<Dependencies, Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.defer {
                f().run(dependencies)
            }
        }
    }
}

public extension EnvIO {
    /// Suspends side effects in the provided registration function. The parameter function is injected with a side-effectful callback for signaling the result of an asynchronous process.
    ///
    /// - Parameter procf: Asynchronous operation.
    /// - Returns: A computation describing the asynchronous operation.
    static func asyncF(_ procF: @escaping (@escaping Callback<Failure, Success>) -> EnvIO<Dependencies, Failure, Void>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.asyncF { callback in
                procF(callback).run(dependencies)
            }
        }
    }
    
    /// Switches the evaluation of this computation to a different `DispatchQueue`.
    ///
    /// - Parameters:
    ///   - queue: A Dispatch Queue.
    /// - Returns: A computation that will run on the provided queue.
    func continueOn(_ queue: DispatchQueue) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            self.run(dependencies).continueOn(queue)
        }
    }
}

public extension EnvIO {
    /// Runs 2 computations in parallel and returns the result of the first one finishing.
    ///
    /// - Parameters:
    ///   - fa: 1st computation
    ///   - fb: 2nd computation
    /// - Returns: A computation with the result of the first computation that finished.
    static func race<A, B>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>
    ) -> EnvIO<Dependencies, Failure, Either<A, B>> where Success == Either<A, B> {
        EnvIO { dependencies in
            IO.race(fa.run(dependencies), fb.run(dependencies))
        }
    }
    
    /// Runs 2 computations in parallel and combines their results using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - f: Combination function.
    /// - Returns: A computation that describes the parallel execution.
    static func parMap<A, B>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ f: @escaping (A, B) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.parMap(fa.run(dependencies), fb.run(dependencies), f)
        }
    }
    
    /// Runs 3 computations in parallel and combines their results using the provided function.
    ///
    /// - Parameters:
    ///   - fa: 1st computation.
    ///   - fb: 2nd computation.
    ///   - fc: 3rd computation.
    ///   - f: Combination function.
    /// - Returns: A computation that describes the parallel execution.
    static func parMap<A, B, C>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ fc: EnvIO<Dependencies, Failure, C>,
        _ f: @escaping (A, B, C) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.parMap(fa.run(dependencies), fb.run(dependencies), fc.run(dependencies), f)
        }
    }
}
