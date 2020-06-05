public enum Try<Success> {
    case failure(Error)
    case success(Success)
    
    public static func catching(_ f: @escaping () throws -> Success) -> Try<Success> {
        do {
            let success = try f()
            return .success(success)
        } catch {
            return .failure(error)
        }
    }
    
    public func fold<A>(
        _ ifFailure: @escaping (Error) -> A,
        _ ifSuccess: @escaping (Success) -> A
    ) -> A {
        switch self {
        case .failure(let error): return ifFailure(error)
        case .success(let success): return ifSuccess(success)
        }
    }
    
    public var isFailure: Bool {
        fold(constant(true), constant(false))
    }
    
    public var isSuccess: Bool {
        !isFailure
    }
    
    public var failureValue: Error? {
        fold(id, constant(nil))
    }
    
    public var successValue: Success? {
        fold(constant(nil), id)
    }
}

extension Try: CustomStringConvertible where Success: CustomStringConvertible {
    public var description: String {
        fold(
            { error in "Failure(\(error))" },
            { success in "Success(\(success.description))" })
    }
}
