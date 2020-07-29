import BowLite

extension Try: Equatable where Success: Equatable {
    public static func ==(lhs: Try<Success>, rhs: Try<Success>) -> Bool {
        switch (lhs, rhs) {
        case (.success(let l), .success(let r)): return l == r
        case (.failure(let l), .failure(let r)): return "\(l)" == "\(r)"
        default: return false
        }
    }
}
