public extension Array {
    subscript(safe index: Int) -> Element? {
        get {
            guard index >= 0, index < count else {
                return nil
            }
            return self[index]
        }
        
        set(newValue) {
            guard index >= 0, index < count, let value = newValue else {
                return
            }
            self[index] = value
        }
    }
}

extension Array: Semigroup {
    public func combine(_ other: Array<Element>) -> Array<Element> {
        self + other
    }
}

extension Array: Monoid {
    public static var empty: Array<Element> {
        []
    }
}
