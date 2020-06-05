public extension Array {
    subscript(safe index: Int) -> Element? {
        guard index >= 0, index < count else {
            return nil
        }
        return self[index]
    }
}

extension Array: Semigroup {
    public func combine(_ other: Array<Element>) -> Array<Element> {
        self + other
    }
}
