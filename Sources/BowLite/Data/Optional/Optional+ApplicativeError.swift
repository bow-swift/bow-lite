public extension Optional {
    static func raiseError() -> Wrapped? {
        nil
    }
    
    static func from<L>(either: Either<L, Wrapped>) -> Wrapped? {
        either.fold(constant(nil), id)
    }
    
    static func from<E: Error>(result: Result<Wrapped, E>) -> Wrapped? {
        result.fold(id, constant(nil))
    }
    
    func handleErrorWith(_ f: @escaping () -> Wrapped?) -> Wrapped? {
        self ?? f()
    }
    
    func handleError(_ f: @escaping () -> Wrapped) -> Wrapped? {
        handleErrorWith(f)
    }
}
