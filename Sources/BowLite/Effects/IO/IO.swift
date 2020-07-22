import Foundation

/// A Task is an IO with no explicit error type, resorting to the `Error` protocol to handle them.
public typealias Task<Success> = IO<Error, Success>

/// An UIO is an IO operation that never fails; i.e. it never produces errors.
public typealias UIO<Success> = IO<Never, Success>

public typealias Callback<Failure: Error, Success> = (Either<Failure, Success>) -> Void

public typealias IOProc<Failure: Error, Success> = (@escaping Callback<Failure, Success>) -> Void

public typealias IOProcF<Failure: Error, Success> = (@escaping Callback<Failure, Success>) -> IO<Failure, Void>

/// An IO is a data type that encapsulates and suspends side effects producing values of type `A` or errors of type `E`.
public class IO<Failure: Error, Success> {
    
    /// Creates an EnvIO with no dependencies from this IO.
//    public func env<D>() -> EnvIO<D, E, A> {
//        EnvIO { _ in self }
//    }
    
    /// Creates an IO from a side-effectful function.
    ///
    /// - Parameter f: Side-effectful function. Errors thrown from this function must be of type `E`; otherwise, a fatal error will happen.
    /// - Returns: An IO suspending the execution of the side effect.
    public static func invoke(_ f: @escaping () throws -> Success) -> IO<Failure, Success> {
        IO.defer {
            do {
                return Pure(try f())
            } catch let error as Failure {
                return RaiseError(error)
            } catch {
                fatalError("IO did not handle error \(error). Only errors of type \(Failure.self) are handled.")
            }
        }
    }
    
    /// Creates an IO from a side-effectful function.
    ///
    /// - Parameter f: Side-effectful function returning an `Either`. Errors thrown from this function must be of type `E`; otherwise, a fatal error will happen.
    /// - Returns: An IO suspending the execution of the side effect.
    public static func invokeEither(_ f: @escaping () throws -> Either<Failure, Success>) -> IO<Failure, Success> {
        IO.defer {
            do {
                return try f().fold(IO.raiseError, IO.pure)
            } catch let error as Failure {
                return raiseError(error)
            } catch {
                fatalError("IO did not handle error \(error). Only errors of type \(Failure.self) are handled.")
            }
        }
    }
    
    /// Creates an IO from a side-effectful function.
    ///
    /// - Parameter f: Side-effectful function returning a `Result`. Errors thrown from this function must be of type `E`; otherwise, a fatal error will happen.
    /// - Returns: An IO suspending the execution of the side effect.
    public static func invokeResult(_ f: @escaping () throws -> Result<Success, Failure>) -> IO<Failure, Success> {
        invokeEither { try f().fold(Either.right, Either.left) }
    }
    
    /// Creates an IO from a side-effectful function.
    ///
    /// - Parameter f: Side-effectful function returning an `Validated`. Errors thrown from this function must be of type `E`; otherwise, a fatal error will happen.
    /// - Returns: An IO suspending the execution of the side effect.
    public static func invokeValidated(_ f: @escaping () throws -> Validated<Failure, Success>) -> IO<Failure, Success> {
        invokeEither { try f().fold(Either.left, Either.right) }
    }
    
    /// Transforms the type arguments of this IO.
    ///
    /// - Parameters:
    ///   - fe: Function to transform the error type argument.
    ///   - fa: Function to transform the output type argument.
    /// - Returns: An IO with both type arguments transformed.
    func bimap<E: Error, B>(
        _ fe: @escaping (Failure) -> E,
        _ fa: @escaping (Success) -> B) -> IO<E, B> {
        mapError(fe).map(fa)
    }
    
    /// Creates an IO from 2 side-effectful functions, tupling their results. Errors thrown from the functions must be of type `E`; otherwise, a fatal error will happen.
    ///
    /// - Parameters:
    ///   - fa: 1st side-effectful function.
    ///   - fb: 2nd side-effectful function.
    /// - Returns: An IO suspending the execution of the side effects.
    public static func merge<A, B>(
        _ fa: @escaping () throws -> A,
        _ fb: @escaping () throws -> B) -> IO<Failure, (A, B)> where Success == (A, B) {
        IO.zip(IO<Failure, A>.invoke(fa),
               IO<Failure, B>.invoke(fb))
    }
    
    /// Creates an IO from 3 side-effectful functions, tupling their results. Errors thrown from the functions must be of type `E`; otherwise, a fatal error will happen.
    ///
    /// - Parameters:
    ///   - fa: 1st side-effectful function.
    ///   - fb: 2nd side-effectful function.
    ///   - fc: 3rd side-effectful function.
    /// - Returns: An IO suspending the execution of the side effects.
    public static func merge<A, B, C>(
        _ fa: @escaping () throws -> A,
        _ fb: @escaping () throws -> B,
        _ fc: @escaping () throws -> C) -> IO<Failure, (A, B, C)> where Success == (A, B, C) {
        IO.zip(IO<Failure, A>.invoke(fa),
               IO<Failure, B>.invoke(fb),
               IO<Failure, C>.invoke(fc))
    }
    
    /// Creates an IO from 4 side-effectful functions, tupling their results. Errors thrown from the functions must be of type `E`; otherwise, a fatal error will happen.
    ///
    /// - Parameters:
    ///   - fa: 1st side-effectful function.
    ///   - fb: 2nd side-effectful function.
    ///   - fc: 3rd side-effectful function.
    ///   - fd: 4th side-effectful function.
    /// - Returns: An IO suspending the execution of the side effects.
    public static func merge<A, B, C, D>(
        _ fa: @escaping () throws -> A,
        _ fb: @escaping () throws -> B,
        _ fc: @escaping () throws -> C,
        _ fd: @escaping () throws -> D) -> IO<Failure, (A, B, C, D)> where Success == (A, B, C, D) {
        IO.zip(IO<Failure, A>.invoke(fa),
               IO<Failure, B>.invoke(fb),
               IO<Failure, C>.invoke(fc),
               IO<Failure, D>.invoke(fd))
    }
    
    /// Creates an IO from 5 side-effectful functions, tupling their results. Errors thrown from the functions must be of type `E`; otherwise, a fatal error will happen.
    ///
    /// - Parameters:
    ///   - fa: 1st side-effectful function.
    ///   - fb: 2nd side-effectful function.
    ///   - fc: 3rd side-effectful function.
    ///   - fd: 4th side-effectful function.
    ///   - ff: 5th side-effectful function.
    /// - Returns: An IO suspending the execution of the side effects.
    public static func merge<A, B, C, D, F>(
        _ fa: @escaping () throws -> A,
        _ fb: @escaping () throws -> B,
        _ fc: @escaping () throws -> C,
        _ fd: @escaping () throws -> D,
        _ ff: @escaping () throws -> F) -> IO<Failure, (A, B, C, D, F)> where Success == (A, B, C, D, F) {
        IO.zip(IO<Failure, A>.invoke(fa),
               IO<Failure, B>.invoke(fb),
               IO<Failure, C>.invoke(fc),
               IO<Failure, D>.invoke(fd),
               IO<Failure, F>.invoke(ff))
    }
    
    /// Creates an IO from 6 side-effectful functions, tupling their results. Errors thrown from the functions must be of type `E`; otherwise, a fatal error will happen.
    ///
    /// - Parameters:
    ///   - fa: 1st side-effectful function.
    ///   - fb: 2nd side-effectful function.
    ///   - fc: 3rd side-effectful function.
    ///   - fd: 4th side-effectful function.
    ///   - ff: 5th side-effectful function.
    ///   - fg: 6th side-effectful function.
    /// - Returns: An IO suspending the execution of the side effects.
    public static func merge<A, B, C, D, F, G>(
        _ fa: @escaping () throws -> A,
        _ fb: @escaping () throws -> B,
        _ fc: @escaping () throws -> C,
        _ fd: @escaping () throws -> D,
        _ ff: @escaping () throws -> F,
        _ fg: @escaping () throws -> G) -> IO<Failure, (A, B, C, D, F, G)> where Success == (A, B, C, D, F, G){
        IO.zip(IO<Failure, A>.invoke(fa),
               IO<Failure, B>.invoke(fb),
               IO<Failure, C>.invoke(fc),
               IO<Failure, D>.invoke(fd),
               IO<Failure, F>.invoke(ff),
               IO<Failure, G>.invoke(fg))
    }
    
    /// Creates an IO from 7 side-effectful functions, tupling their results. Errors thrown from the functions must be of type `E`; otherwise, a fatal error will happen.
    ///
    /// - Parameters:
    ///   - fa: 1st side-effectful function.
    ///   - fb: 2nd side-effectful function.
    ///   - fc: 3rd side-effectful function.
    ///   - fd: 4th side-effectful function.
    ///   - ff: 5th side-effectful function.
    ///   - fg: 6th side-effectful function.
    ///   - fh: 7th side-effectful function.
    /// - Returns: An IO suspending the execution of the side effects.
    public static func merge<A, B, C, D, F, G, H>(
        _ fa: @escaping () throws -> A,
        _ fb: @escaping () throws -> B,
        _ fc: @escaping () throws -> C,
        _ fd: @escaping () throws -> D,
        _ ff: @escaping () throws -> F,
        _ fg: @escaping () throws -> G,
        _ fh: @escaping () throws -> H ) -> IO<Failure, (A, B, C, D, F, G, H)> where Success == (A, B, C, D, F, G, H) {
        IO.zip(IO<Failure, A>.invoke(fa),
               IO<Failure, B>.invoke(fb),
               IO<Failure, C>.invoke(fc),
               IO<Failure, D>.invoke(fd),
               IO<Failure, F>.invoke(ff),
               IO<Failure, G>.invoke(fg),
               IO<Failure, H>.invoke(fh))
    }
    
    /// Creates an IO from 8 side-effectful functions, tupling their results. Errors thrown from the functions must be of type `E`; otherwise, a fatal error will happen.
    ///
    /// - Parameters:
    ///   - fa: 1st side-effectful function.
    ///   - fb: 2nd side-effectful function.
    ///   - fc: 3rd side-effectful function.
    ///   - fd: 4th side-effectful function.
    ///   - ff: 5th side-effectful function.
    ///   - fg: 6th side-effectful function.
    ///   - fh: 7th side-effectful function.
    ///   - fi: 8th side-effectful function.
    /// - Returns: An IO suspending the execution of the side effects.
    public static func merge<A, B, C, D, F, G, H, I>(
        _ fa: @escaping () throws -> A,
        _ fb: @escaping () throws -> B,
        _ fc: @escaping () throws -> C,
        _ fd: @escaping () throws -> D,
        _ ff: @escaping () throws -> F,
        _ fg: @escaping () throws -> G,
        _ fh: @escaping () throws -> H,
        _ fi: @escaping () throws -> I) -> IO<Failure, (A, B, C, D, F, G, H, I)> where Success == (A, B, C, D, F, G, H, I) {
        IO.zip(IO<Failure, A>.invoke(fa),
               IO<Failure, B>.invoke(fb),
               IO<Failure, C>.invoke(fc),
               IO<Failure, D>.invoke(fd),
               IO<Failure, F>.invoke(ff),
               IO<Failure, G>.invoke(fg),
               IO<Failure, H>.invoke(fh),
               IO<Failure, I>.invoke(fi))
    }
    
    /// Creates an IO from 9 side-effectful functions, tupling their results. Errors thrown from the functions must be of type `E`; otherwise, a fatal error will happen.
    ///
    /// - Parameters:
    ///   - fa: 1st side-effectful function.
    ///   - fb: 2nd side-effectful function.
    ///   - fc: 3rd side-effectful function.
    ///   - fd: 4th side-effectful function.
    ///   - ff: 5th side-effectful function.
    ///   - fg: 6th side-effectful function.
    ///   - fh: 7th side-effectful function.
    ///   - fi: 8th side-effectful function.
    ///   - fj: 9th side-effectful function.
    /// - Returns: An IO suspending the execution of the side effects.
    public static func merge<A, B, C, D, F, G, H, I, J>(
        _ fa: @escaping () throws -> A,
        _ fb: @escaping () throws -> B,
        _ fc: @escaping () throws -> C,
        _ fd: @escaping () throws -> D,
        _ ff: @escaping () throws -> F,
        _ fg: @escaping () throws -> G,
        _ fh: @escaping () throws -> H,
        _ fi: @escaping () throws -> I,
        _ fj: @escaping () throws -> J ) -> IO<Failure, (A, B, C, D, F, G, H, I, J)> where Success == (A, B, C, D, F, G, H, I, J) {
        IO.zip(IO<Failure, A>.invoke(fa),
               IO<Failure, B>.invoke(fb),
               IO<Failure, C>.invoke(fc),
               IO<Failure, D>.invoke(fd),
               IO<Failure, F>.invoke(ff),
               IO<Failure, G>.invoke(fg),
               IO<Failure, H>.invoke(fh),
               IO<Failure, I>.invoke(fi),
               IO<Failure, J>.invoke(fj))
    }
    
    /// Performs the side effects that are suspended in this IO in a synchronous manner.
    ///
    /// - Parameter queue: Dispatch queue used to execute the side effects. Defaults to the main queue.
    /// - Returns: Value produced after running the suspended side effects.
    /// - Throws: Error of type `E` that may happen during the evaluation of the side-effects. Errors of other types thrown from the evaluation of this IO will cause a fatal error.
    public func unsafeRunSync(on queue: DispatchQueue = .main) throws -> Success {
        let either = self.unsafeRunSyncEither(on: queue)
        switch either {
        case .left(let left): throw left
        case .right(let right): return right
        }
    }
    
    /// Performs the side effects that are suspended in this IO in a synchronous manner.
    ///
    /// - Parameter queue: Dispatch queue used to execute the side effects. Defaults to the main queue.
    /// - Returns: An Either wrapping errors in the left side and values on the right side. Errors of other types thrown from the evaluation of this IO will cause a fatal error.
    public func unsafeRunSyncEither(on queue: DispatchQueue = .main) -> Either<Failure, Success> {
        self._unsafeRunSyncEither(on: .queue(queue)).run().0
    }
    
    internal func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<Failure, Success>, Queue)> {
        fatalError("_unsafeRunSyncEither(on:) must be implemented in subclasses")
    }
    
    internal func on<T>(queue: Queue, perform: @escaping () -> T) -> T {
        queue.sync { perform() }
    }
    
    /// Flattens the internal structure of this IO by performing the side effects and wrapping them again in an IO structure containing the result or the error produced.
    ///
    /// - Parameter queue: Dispatch queue used to execute the side effects. Defaults to the main queue.
    /// - Returns: An IO that either contains the value produced or an error. Errors of other types thrown from the evaluation of this IO will cause a fatal error.
    public func attempt(on queue: DispatchQueue = .main) -> IO<Failure, Success> {
        do {
            let result = try self.unsafeRunSync(on: queue)
            return IO.pure(result)
        } catch let error as Failure {
            return IO.raiseError(error)
        } catch {
            fail(error)
        }
    }
    
    /// Performs the side effects that are suspended in this IO in an asynchronous manner.
    ///
    /// - Parameters:
    ///   - queue: Dispatch queue used to execute the side effects. Defaults to the main queue.
    ///   - callback: A callback function to receive the results of the evaluation. Errors of other types thrown from the evaluation of this IO will cause a fatal error.
    public func unsafeRunAsync(on queue: DispatchQueue = .main, _ callback: @escaping Callback<Failure, Success> = { _ in }) {
        queue.async {
            callback(self.unsafeRunSyncEither(on: queue))
        }
    }
    
    /// Transforms the error type of this IO.
    ///
    /// - Parameter f: Function transforming the error.
    /// - Returns: An IO value with the new error type.
    public func mapError<E: Error>(_ f: @escaping (Failure) -> E) -> IO<E, Success> {
        FErrorMap(f, self)
    }
    
    /// Returns this `IO` erasing the error type information
    public var anyError: IO<Error, Success> {
        self.mapError { e in e as Error }
    }
    
    internal func fail(_ error: Error) -> Never {
        fatalError("IO did not handle error: \(error). Only errors of type \(Failure.self) are handled.")
    }
    
    /// Folds over the result of this computation by accepting an effect to execute in case of error, and another one in the case of success.
    ///
    /// - Parameters:
    ///   - f: Function to run in case of error.
    ///   - g: Function to run in case of success.
    /// - Returns: A computation from the result of applying the provided functions to the result of this computation.
    public func foldM<B>(
        _ f: @escaping (Failure) -> IO<Failure, B>,
        _ g: @escaping (Success) -> IO<Failure, B>) -> IO<Failure, B> {
        self.flatMap(g).handleErrorWith(f)
    }
    
    /// Retries this computation if it fails based on the provided retrial policy.
    ///
    /// This computation will be at least executed once, and if it fails, it will be retried according to the policy.
    ///
    /// - Parameter policy: Retrial policy.
    /// - Returns: A computation that is retried based on the provided policy when it fails.
//    public func retry<S, O>(_ policy: Schedule<Any, E, S, O>) -> IO<E, A> {
//        self.env().retry(policy).provide(())
//    }
    
    /// Retries this computation if it fails based on the provided retrial policy, providing a default computation to handle failures after retrial.
    ///
    /// This computation will be at least executed once, and if it fails, it will be retried according to the policy.
    ///
    /// - Parameters:
    ///   - policy: Retrial policy.
    ///   - orElse: Function to handle errors after retrying.
    /// - Returns: A computation that is retried based on the provided policy when it fails.
//    public func retry<S, O, B>(
//        _ policy: Schedule<Any, E, S, O>,
//        orElse: @escaping (E, O) -> IO<E, B>) -> IO<E, Either<B, A>> {
//        self.env().retry(
//            policy,
//            orElse: { e, o in orElse(e, o).env() }).provide(())
//    }
    
    /// Repeats this computation until the provided repeating policy completes, or until it fails.
    ///
    /// This computation will be at least executed once, and if it succeeds, it will be repeated additional times according to the policy.
    ///
    /// - Parameters:
    ///   - policy: Repeating policy.
    ///   - onUpdateError: A function providing an error in case the policy fails to update properly.
    /// - Returns: A computation that is repeated based on the provided policy when it succeeds.
//    public func `repeat`<S, O>(
//        _ policy: Schedule<Any, A, S, O>,
//        onUpdateError: @escaping () -> E = { fatalError("Impossible to update error on repeat.") }) -> IO<E, O> {
//        self.env().repeat(
//            policy,
//            onUpdateError: onUpdateError).provide(())
//    }
    
    /// Repeats this computation until the provided repeating policy completes, or until it fails, with a function to handle potential failures.
    ///
    /// - Parameters:
    ///   - policy: Repeating policy.
    ///   - onUpdateError: A function providing an error in case the policy fails to update properly.
    ///   - orElse: A function to return a computation in case of error.
    /// - Returns: A computation that is repeated based on the provided policy when it succeeds.
//    public func `repeat`<S, O, B>(
//        _ policy: Schedule<Any, A, S, O>,
//        onUpdateError: @escaping () -> E = { fatalError("Impossible to update error on repeat.") },
//        orElse: @escaping (E, O?) -> IO<E, B>) -> IO<E, Either<B, O>> {
//        self.env().repeat(
//            policy,
//            onUpdateError: onUpdateError,
//            orElse: { e, o in orElse(e, o).env() }).provide(())
//    }
}

public extension IO where Success == Void {
    /// Sleeps for the specified amount of time.
    ///
    /// - Parameter interval: Interval of time to sleep.
    /// - Returns: An IO that sleeps for the specified amount of time.
    static func sleep(_ interval: DispatchTimeInterval) -> IO<Failure, Void> {
        if let timeInterval = interval.toDouble() {
            return IO.invoke {
                Thread.sleep(forTimeInterval: timeInterval)
            }
        } else {
            return IO.never()
        }
    }
    
    /// Sleeps for the specified amount of time.
    ///
    /// - Parameter interval: Interval of time to sleep.
    /// - Returns: An IO that sleeps for the specified amount of time.
    static func sleep(_ interval: TimeInterval) -> IO<Failure, Void> {
        IO.invoke {
            Thread.sleep(forTimeInterval: interval)
        }
    }
}

// MARK: Functions for Task
public extension IO where Failure == Error {
    /// Creates an IO from a side-effectful function.
    ///
    /// - Parameter f: Side-effectful function returning a `Try`. Errors thrown from this function must be of type `E`; otherwise, a fatal error will happen.
    /// - Returns: An IO suspending the execution of the side effect.
    static func invokeTry(_ f: @escaping () throws -> Try<Success>) -> IO<Error, Success> {
        invokeEither { try f().fold(Either.left, Either.right) }
    }
}

internal class Pure<E: Error, A>: IO<E, A> {
    let a: A
    
    init(_ a: A) {
        self.a = a
    }
    
    override internal func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<E, A>, Queue)> {
        .done((on(queue: queue) { .right(self.a) }, queue))
    }
}

internal class RaiseError<E: Error, A>: IO<E, A> {
    let error: E
    
    init(_ error: E) {
        self.error = error
    }
    
    override internal func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<E, A>, Queue)> {
        .done((on(queue: queue) { .left(self.error) }, queue))
    }
}

internal class HandleErrorWith<E: Error, A>: IO<E, A> {
    let fa: IO<E, A>
    let f: (E) -> IO<E, A>
    
    init(_ fa: IO<E, A>, _ f: @escaping (E) -> IO<E, A>) {
        self.fa = fa
        self.f = f
    }
    
    override internal func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<E, A>, Queue)> {
        .defer {
            self.fa._unsafeRunSyncEither(on: queue).flatMap { result in
                result.0.fold({ e in self.f(e)._unsafeRunSyncEither(on: queue) },
                              { a in .done((.right(a), result.1)) })
            }
        }
    }
}

internal class FMap<E: Error, A, B>: IO<E, B> {
    let f: (A) -> B
    let action: IO<E, A>
    
    init(_ f: @escaping (A) -> B, _ action: IO<E, A>) {
        self.f = f
        self.action = action
    }
    
    override internal func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<E, B>, Queue)> {
        .defer {
            self.action._unsafeRunSyncEither(on: queue).map { result in
                (self.on(queue: result.1) { result.0.map(self.f) }, result.1)
            }
        }
    }
}

internal class FErrorMap<E: Error, A, EE: Error>: IO<EE, A> {
    let f: (E) -> EE
    let action: IO<E, A>
    
    init(_ f: @escaping (E) -> EE, _ action: IO<E, A>) {
        self.f = f
        self.action = action
    }
    
    override internal func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<EE, A>, Queue)> {
        .defer {
            self.action._unsafeRunSyncEither(on: queue).map { result in
                (result.0.mapLeft(self.f), result.1)
            }
        }
    }
}

internal class Join<E: Error, A>: IO<E, A> {
    let io: IO<E, IO<E, A>>
    
    init(_ io: IO<E, IO<E, A>>) {
        self.io = io
    }
    
    override internal func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<E, A>, Queue)> {
        .defer {
            self.io._unsafeRunSyncEither(on: queue).flatMap { result in
                result.0.fold({ e in .done((.left(e), result.1)) },
                              { io in io._unsafeRunSyncEither(on: result.1) })
            }
        }
    }
}

internal class AsyncIO<E: Error, A>: IO<E, A> {
    let f: IOProcF<E, A>
    
    init(_ f: @escaping IOProcF<E, A>) {
        self.f = f
    }
    
    override internal func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<E, A>, Queue)> {
        var result: Either<E, A>?
        let group = DispatchGroup()
        group.enter()
        let callback: Callback<E, A> = { either in
            result = either
            group.leave()
        }
        let io = self.on(queue: queue) {
            self.f(callback)
        }
        let procResult = io._unsafeRunSyncEither(on: queue)
        group.wait()
        
        return procResult.flatMap { procRes in
            IO.from(either: result!)._unsafeRunSyncEither(on: procRes.1).map { res in
                (res.0, procRes.1)
            }
        }
    }
}

internal class ContinueOn<E: Error, A>: IO<E, A> {
    let io: IO<E, A>
    let queue: DispatchQueue
    
    init(_ io: IO<E, A>, _ queue: DispatchQueue) {
        self.io = io
        self.queue = queue
    }
    
    override internal func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<E, A>, Queue)> {
        self.io._unsafeRunSyncEither(on: queue).map { result in
            (result.0, .queue(self.queue))
        }
    }
}

internal class BracketIO<E: Error, A, B>: IO<E, B> {
    let acquire: IO<E, A>
    let release: (A, ExitCase<E>) -> IO<E, Void>
    let use: (A) throws -> IO<E, B>
    
    init(_ acquire: IO<E, A>,
         _ release: @escaping (A, ExitCase<E>) -> IO<E, Void>,
         _ use: @escaping (A) throws -> IO<E, B>) {
        self.acquire = acquire
        self.release = release
        self.use = use
    }
    
    override func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<E, B>, Queue)> {
        self.acquire._unsafeRunSyncEither(on: queue).flatMap { ioRes in
            ioRes.0.fold(
                { e in Trampoline.done((.left(e), ioRes.1)) },
                { res in
                    do {
                        return try self.use(res)
                            .flatTap { _ in self.release(res, .completed) }
                            .flatTapError { e in self.release(res, .error(e)) }
                            ._unsafeRunSyncEither(on: queue)
                    } catch let error as E {
                        let _ = self.release(res, .error(error))._unsafeRunSyncEither(on: queue)
                        return .done((.left(error), queue))
                    } catch {
                        self.fail(error)
                    }
                })
        }
    }
}

internal class Race<E: Error, A, B>: IO<E, Either<A, B>> {
    private let fa: IO<E, A>
    private let fb: IO<E, B>
    
    init(_ fa: IO<E, A>, _ fb: IO<E, B>) {
        self.fa = fa
        self.fb = fb
    }
    
    override func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<E, Either<A, B>>, Queue)> {
        let result = Atomic<Either<(Either<E, A>, Queue), (Either<E, B>, Queue)>?>(nil)
        let group = DispatchGroup()
        let parQueue1: Queue = .queue(label: queue.label + "raceA", qos: queue.qos)
        let parQueue2: Queue = .queue(label: queue.label + "raceB", qos: queue.qos)
        
        group.enter()
        parQueue1.async {
            let a = self.fa._unsafeRunSyncEither(on: parQueue1).run()
            if result.setIfNil(.left(a)) {
                group.leave()
            }
        }
        
        parQueue2.async {
            let b = self.fb._unsafeRunSyncEither(on: parQueue2).run()
            if result.setIfNil(.right(b)) {
                group.leave()
            }
        }
        
        group.wait()
        if let value = result.value {
            return .done(value.fold(
                { a in (a.0.map(Either.left), a.1) } ,
                { b in (b.0.map(Either.right), b.1) }))
        } else {
            fatalError("Both operations failed to finish.") // Should never happen
        }
    }
}

internal class ParMap2<E: Error, A, B, Z>: IO<E, Z> {
    private let fa: IO<E, A>
    private let fb: IO<E, B>
    private let f: (A, B) -> Z
    
    init(_ fa: IO<E, A>, _ fb: IO<E, B>, _ f: @escaping (A, B) -> Z) {
        self.fa = fa
        self.fb = fb
        self.f = f
    }
    
    override func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<E, Z>, Queue)> {
        var a: (Either<E, A>, Queue)?
        var b: (Either<E, B>, Queue)?
        let group = DispatchGroup()
        let parQueue1: Queue = .queue(label: queue.label + "parMap1", qos: queue.qos)
        let parQueue2: Queue = .queue(label: queue.label + "parMap2", qos: queue.qos)
        
        group.enter()
        parQueue1.async {
            a = self.fa._unsafeRunSyncEither(on: parQueue1).run()
            group.leave()
        }
        
        group.enter()
        parQueue2.async {
            b = self.fb._unsafeRunSyncEither(on: parQueue2).run()
            group.leave()
        }
        
        group.wait()
        if let aa = a, let bb = b {
            return .done((Either.map(aa.0, bb.0, self.f), queue))
        } else {
            fatalError("An operation finished without producing a result.") // Should never happen
        }
    }
}

internal class ParMap3<E: Error, A, B, C, Z>: IO<E, Z> {
    private let fa: IO<E, A>
    private let fb: IO<E, B>
    private let fc: IO<E, C>
    private let f: (A, B, C) -> Z
    
    init(_ fa: IO<E, A>, _ fb: IO<E, B>, _ fc: IO<E, C>, _ f: @escaping (A, B, C) -> Z) {
        self.fa = fa
        self.fb = fb
        self.fc = fc
        self.f = f
    }
    
    override func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<E, Z>, Queue)> {
        var a: (Either<E, A>, Queue)?
        var b: (Either<E, B>, Queue)?
        var c: (Either<E, C>, Queue)?
        let group = DispatchGroup()
        let parQueue1: Queue = .queue(label: queue.label + "parMap1", qos: queue.qos)
        let parQueue2: Queue = .queue(label: queue.label + "parMap2", qos: queue.qos)
        let parQueue3: Queue = .queue(label: queue.label + "parMap3", qos: queue.qos)
        
        group.enter()
        parQueue1.async {
            a = self.fa._unsafeRunSyncEither(on: parQueue1).run()
            group.leave()
        }
        
        group.enter()
        parQueue2.async {
            b = self.fb._unsafeRunSyncEither(on: parQueue2).run()
            group.leave()
        }
        
        group.enter()
        parQueue3.async {
            c = self.fc._unsafeRunSyncEither(on: parQueue3).run()
            group.leave()
        }
        
        group.wait()
        if let aa = a, let bb = b, let cc = c {
            return .done((Either.map(aa.0, bb.0, cc.0, self.f), queue))
        } else {
            fatalError("An operation finished without producing a result.") // Should never happen
        }
    }
}

internal class IOEffect<E: Error, A>: IO<E, Void> {
    let io: IO<E, A>
    let callback: (Either<E, A>) -> IO<E, Void>
    
    init(_ io: IO<E, A>, _ callback: @escaping (Either<E, A>) -> IO<E, Void>) {
        self.io = io
        self.callback = callback
    }
    
    override func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<E, Void>, Queue)> {
        self.io._unsafeRunSyncEither(on: queue).flatMap { result in
            return self.callback(result.0)._unsafeRunSyncEither(on: result.1)
        }
    }
}

internal class Suspend<E: Error, A>: IO<E, A> {
    let thunk: () -> IO<E, A>
    
    init(_ thunk: @escaping () -> IO<E, A>) {
        self.thunk = thunk
    }
    
    override func _unsafeRunSyncEither(on queue: Queue = .queue()) -> Trampoline<(Either<E, A>, Queue)> {
        self.on(queue: queue) {
            self.thunk()._unsafeRunSyncEither(on: queue)
        }
    }
}

public extension IO {
    func map<B>(
        _ f: @escaping (Success) -> B) -> IO<Failure, B> {
        FMap(f, self)
    }
}

public extension IO {
    static func pure(_ a: Success) -> IO<Failure, Success> {
        Pure(a)
    }
}

public extension IO {
    func flatMap<B>(
        _ f: @escaping (Success) -> IO<Failure, B>) -> IO<Failure, B> {
        Join(self.map { x in f(x) })
    }
}

public extension IO {
    static func raiseError(_ e: Failure) -> IO<Failure, Success> {
        RaiseError(e)
    }
    
    func handleErrorWith(
        _ f: @escaping (Failure) -> IO<Failure, Success>) -> IO<Failure, Success> {
        HandleErrorWith(self) { e in f(e) }
    }
}

public extension IO {
    func bracketCase<B>(
        release: @escaping (Success, ExitCase<Failure>) -> IO<Failure, Void>,
        use: @escaping (Success) throws -> IO<Failure, B>) -> IO<Failure, B> {
        BracketIO<Failure, Success, B>(self, release, use)
    }
}

public extension IO {
    static func `defer`(_ fa: @escaping () -> IO<Failure, Success>) -> IO<Failure, Success> {
        Suspend(fa)
    }
}

public extension IO {
    static func asyncF(_ procf: @escaping IOProcF<Failure, Success>) -> IO<Failure, Success> {
        AsyncIO(procf)
    }
    
    func continueOn(
        _ queue: DispatchQueue) -> IO<Failure, Success> {
        ContinueOn(self, queue)
    }
}

public extension IO {
    static func race<A, B>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>) -> IO<Failure, Either<A, B>> where Success == Either<A, B> {
        Race(fa, fb)
    }
    
    static func parMap<A, B>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ f: @escaping (A, B) -> Success) -> IO<Failure, Success> {
        ParMap2(fa, fb, f)
    }
    
    static func parMap<A, B, C>(
        _ fa: IO<Failure, A>,
        _ fb: IO<Failure, B>,
        _ fc: IO<Failure, C>,
        _ f: @escaping (A, B, C) -> Success) -> IO<Failure, Success> {
        ParMap3(fa, fb, fc, f)
    }
}

public extension IO {
    func runAsync(
        _ callback: @escaping (Either<Failure, Success>) -> IO<Failure, Void>) -> IO<Failure, Void> {
        IOEffect(self, callback)
    }
}
