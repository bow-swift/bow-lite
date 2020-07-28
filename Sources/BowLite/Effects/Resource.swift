/// Resource models resource allocation and releasing. It is specially useful when multiple resources that depend on each other need to be acquired and later released in reverse order. Whn a resource is created, one can make use of the `use` method to run a computation with the resource. The finalizers are guaranteed to run afterwards in reverse order of acquisition.
public class IOResource<Failure: Error, Resource> {
    /// Initializes a resource.
    ///
    /// - Parameters:
    ///   - acquire: Function to acquire the resource.
    ///   - release: Function to release the resource.
    /// - Returns: A Resource that will run the provided functions to acquire and release it.
    public static func from(
        acquire: @escaping () -> IO<Failure, Resource>,
        release: @escaping (Resource, ExitCase<Failure>) -> IO<Failure, ()>) -> IOResource<Failure, Resource> {
        IORegularResource(acquire, release)
    }
    
    /// Uses the resource.
    ///
    /// - Parameter f: Function to use the resource.
    /// - Returns: Result of using the resource.
    public func use<Output>(_ f: @escaping (Resource) -> IO<Failure, Output>) -> IO<Failure, Output> {
        fatalError("use must be implemented in subclasses")
    }
}

public extension IOResource {
    func map<B>(_ f: @escaping (Resource) -> B) -> IOResource<Failure, B> {
        self.flatMap { a in .pure(f(a)) }
    }
}

public extension IOResource {
    static func pure(_ a: Resource) -> IOResource<Failure, Resource> {
        IORegularResource({ IO.pure(a) }, { _, _ in IO.pure(()) })
    }
    
    static func zip<A, B>(
        _ fa: IOResource<Failure, A>,
        _ fb: IOResource<Failure, B>
    ) -> IOResource<Failure, (A, B)> where Resource == (A, B) {
        fa.flatMap { resource in
            fb.map { other in (resource, other) }
        }
    }
    
    static func map<A, B>(
        _ fa: IOResource<Failure, A>,
        _ fb: IOResource<Failure, B>,
        _ f: @escaping (A, B) -> Resource
    ) -> IOResource<Failure, Resource> {
        IOResource<Failure, (A, B)>.zip(fa, fb).map(f)
    }
}

public extension IOResource {
    func flatMap<B>(
        _ f: @escaping (Resource) -> IOResource<Failure, B>) -> IOResource<Failure, B> {
        IOBindResource<Failure, Resource, B>(self, f)
    }
}

public extension IOResource where Resource: Semigroup {
    func combine(_ other: IOResource<Failure, Resource>) -> IOResource<Failure, Resource> {
        self.flatMap { r in other.map { r2 in r.combine(r2) } }
    }
}

public extension IOResource where Resource: Monoid {
    static var empty: IOResource<Failure, Resource> {
        .pure(Resource.empty)
    }
}

private class IORegularResource<Failure: Error, Resource>: IOResource<Failure, Resource> {
    fileprivate let acquire: () -> IO<Failure, Resource>
    fileprivate let release: (Resource, ExitCase<Failure>) -> IO<Failure, Void>
    
    public init(
        _ acquire: @escaping () -> IO<Failure, Resource>,
        _ release: @escaping (Resource, ExitCase<Failure>) -> IO<Failure, ()>) {
        self.acquire = acquire
        self.release = release
    }
    
    public convenience init(
        _ acquire: @escaping () -> IO<Failure, Resource>,
        _ release: @escaping (Resource) -> IO<Failure, ()>) {
        self.init(acquire, { a, _ in release(a) })
    }
    
    override func use<Output>(_ f: @escaping (Resource) -> IO<Failure, Output>) -> IO<Failure, Output> {
        acquire().bracketCase(release: release, use: f)
    }
}

private class IOBindResource<Failure: Error, A, B>: IOResource<Failure, B> {
    private let resource: IOResource<Failure, A>
    private let f: (A) -> IOResource<Failure, B>
    
    init(_ resource: IOResource<Failure, A>,
         _ f: @escaping (A) -> IOResource<Failure, B>) {
        self.resource = resource
        self.f = f
    }
    
    override func use<Output>(_ f: @escaping (B) -> IO<Failure, Output>) -> IO<Failure, Output> {
        self.resource.use { a in
            self.f(a).use(f)
        }
    }
}
