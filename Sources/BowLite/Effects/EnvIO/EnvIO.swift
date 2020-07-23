import Foundation

public typealias RIO<Dependencies, Success> = EnvIO<Dependencies, Error, Success>
public typealias URIO<Dependencies, Success> = EnvIO<Dependencies, Never, Success>

public struct EnvIO<Dependencies, Failure: Error, Success> {
    public let run: (Dependencies) -> IO<Failure, Success>
    
    public init(_ run: @escaping (Dependencies) -> IO<Failure, Success>) {
        self.run = run
    }
    
    public static func invoke(_ f: @escaping (Dependencies) throws -> Success) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.invoke {
                try f(dependencies)
            }
        }
    }
    
    public static func invokeEither(_ f: @escaping (Dependencies) -> Either<Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.invokeEither {
                f(dependencies)
            }
        }
    }
    
    public static func invokeResult(_ f: @escaping (Dependencies) -> Result<Success, Failure>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.invokeResult {
                f(dependencies)
            }
        }
    }
    
    public static func invokeValidated(_ f: @escaping (Dependencies) -> Validated<Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.invokeValidated {
                f(dependencies)
            }
        }
    }
    
    public static func liftF(_ io: IO<Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { _ in io }
    }
    
    public static func accessM(_ f: @escaping (Dependencies) -> EnvIO<Dependencies, Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO<Dependencies, Failure, Dependencies>.ask().flatMap(f)
    }
    
    public static func access(_ f: @escaping (Dependencies) -> Success) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.pure(f(dependencies))
        }
    }
    
    public static func pure(_ success: Success) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { _ in IO.pure(success) }
    }
    
    public static func raiseError(_ failure: Failure) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { _ in IO.raiseError(failure) }
    }
    
    public func provide(_ dependencies: Dependencies) -> IO<Failure, Success> {
        self.run(dependencies)
    }
    
    public func callAsFunction(_ dependencies: Dependencies) -> IO<Failure, Success> {
        self.run(dependencies)
    }
    
    public func contramap<D>(_ f: @escaping (D) -> Dependencies) -> EnvIO<D, Failure, Success> {
        EnvIO<D, Failure, Success>(f >>> self.run)
    }
    
    public func mapError<E: Error>(_ f: @escaping (Failure) -> E) -> EnvIO<Dependencies, E, Success> {
        EnvIO<Dependencies, E, Success> { dependencies in
            self.run(dependencies).mapError(f)
        }
    }
    
    public func transformT<E: Error, A>(_ f: @escaping (IO<Failure, Success>) -> IO<E, A>) -> EnvIO<Dependencies, E, A> {
        EnvIO<Dependencies, E, A>(self.run >>> f)
    }
    
    public func map<B>(_ f: @escaping (Success) -> B) -> EnvIO<Dependencies, Failure, B> {
        EnvIO<Dependencies, Failure, B> { dependencies in
            self.run(dependencies).map(f)
        }
    }
    
    public func handleErrorWith(_ f: @escaping (Failure) -> EnvIO<Dependencies, Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            self.run(dependencies).handleErrorWith { error in
                f(error).run(dependencies)
            }
        }
    }
    
    public func bimap<E: Error, B>(
        _ f: @escaping (Failure) -> E,
        _ g: @escaping (Success) -> B
    ) -> EnvIO<Dependencies, E, B> {
        self.mapError(f).map(g)
    }
    
    public func dimap<D, B>(
        _ f: @escaping (D) -> Dependencies,
        _ g: @escaping (Success) -> B
    ) -> EnvIO<D, Failure, B> {
        self.contramap(f).map(g)
    }
    
    public func flatMap<B>(_ f: @escaping (Success) -> EnvIO<Dependencies, Failure, B>) -> EnvIO<Dependencies, Failure, B> {
        EnvIO<Dependencies, Failure, B> { dependencies in
            self.run(dependencies).flatMap { success in
                f(success).run(dependencies)
            }
        }
    }
    
    public func andThen<B>(_ f: EnvIO<Success, Failure, B>) -> EnvIO<Dependencies, Failure, B> {
        EnvIO<Dependencies, Failure, B> { dependencies in
            self.run(dependencies).flatMap { success in
                f.run(success)
            }
        }
    }
    
    public func andThen<B>(_ f: @escaping (Success) -> IO<Failure, B>) -> EnvIO<Dependencies, Failure, B> {
        andThen(EnvIO<Success, Failure, B>(f))
    }
    
    public func andThen<B>(_ io: IO<Failure, B>) -> EnvIO<Dependencies, Failure, B> {
        andThen(constant(io))
    }
    
    public func foldM<B>(
        _ f: @escaping (Failure) -> EnvIO<Dependencies, Failure, B>,
        _ g: @escaping (Success) -> EnvIO<Dependencies, Failure, B>
    ) -> EnvIO<Dependencies, Failure, B> {
        self.flatMap(g).handleErrorWith(f)
    }
    
    public func foldA<B>(
        _ f: @escaping (Failure) -> B,
        _ g: @escaping (Success) -> B
    ) -> EnvIO<Dependencies, Failure, B> {
        foldM(f >>> EnvIO<Dependencies, Failure, B>.pure,
              g >>> EnvIO<Dependencies, Failure, B>.pure)
    }
    
    public func local(_ f: @escaping (Dependencies) -> Dependencies) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO(f >>> self.run)
    }
    
    public func unsafeRunSync(
        with dependencies: Dependencies,
        on queue: DispatchQueue = .main
    ) throws -> Success {
        try self.run(dependencies).unsafeRunSync(on: queue)
    }
    
    public func unsafeRunSyncEither(
        with dependencies: Dependencies,
        on queue: DispatchQueue = .main
    ) -> Either<Failure, Success> {
        self.run(dependencies).unsafeRunSyncEither(on: queue)
    }
    
    public func unsafeRunAsync(
        with dependepencies: Dependencies,
        on queue: DispatchQueue = .main,
        _ callback: @escaping Callback<Failure, Success> = { _ in }
    ) {
        self.run(dependepencies).unsafeRunAsync(on: queue, callback)
    }
}

public extension EnvIO where Dependencies == Any {
    func narrow<D>() -> EnvIO<D, Failure, Success> {
        self.contramap(id)
    }
    
    func unsafeRunSync(
        on queue: DispatchQueue = .main
    ) throws -> Success {
        try self.run(()).unsafeRunSync(on: queue)
    }
    
    func unsafeRunSyncEither(
        on queue: DispatchQueue = .main
    ) -> Either<Failure, Success> {
        self.run(()).unsafeRunSyncEither(on: queue)
    }
    
    func unsafeRunAsync(
        on queue: DispatchQueue = .main,
        _ callback: @escaping Callback<Failure, Success> = { _ in }
    ) {
        self.run(()).unsafeRunAsync(on: queue, callback)
    }
}

public extension EnvIO where Success == Dependencies {
    static func ask() -> EnvIO<Dependencies, Failure, Dependencies> {
        EnvIO { dependencies in IO.pure(dependencies) }
    }
}

public extension EnvIO where Failure == Error {
    static func invokeTry(_ f: @escaping (Dependencies) -> Try<Success>) -> EnvIO<Dependencies, Error, Success> {
        EnvIO { dependencies in
            IO.invokeTry {
                f(dependencies)
            }
        }
    }
}

public extension EnvIO where Success == Void {
    static func sleep(_ interval: TimeInterval) -> EnvIO<Dependencies, Failure, Void> {
        EnvIO { _ in IO.sleep(interval) }
    }
    
    static func sleep(_ interval: DispatchTimeInterval) -> EnvIO<Dependencies, Failure, Void> {
        EnvIO { _ in IO.sleep(interval) }
    }
}

public extension EnvIO {
    static func `defer`(_ f: @escaping () -> EnvIO<Dependencies, Failure, Success>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.defer {
                f().run(dependencies)
            }
        }
    }
}

public extension EnvIO {
    static func asyncF(_ procF: @escaping (@escaping Callback<Failure, Success>) -> EnvIO<Dependencies, Failure, Void>) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.asyncF { callback in
                procF(callback).run(dependencies)
            }
        }
    }
    
    func continueOn(_ queue: DispatchQueue) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            self.run(dependencies).continueOn(queue)
        }
    }
}

public extension EnvIO {
    static func race<A, B>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>
    ) -> EnvIO<Dependencies, Failure, Either<A, B>> where Success == Either<A, B> {
        EnvIO { dependencies in
            IO.race(fa.run(dependencies), fb.run(dependencies))
        }
    }
    
    static func parMap<A, B>(
        _ fa: EnvIO<Dependencies, Failure, A>,
        _ fb: EnvIO<Dependencies, Failure, B>,
        _ f: @escaping (A, B) -> Success
    ) -> EnvIO<Dependencies, Failure, Success> {
        EnvIO { dependencies in
            IO.parMap(fa.run(dependencies), fb.run(dependencies), f)
        }
    }
    
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
