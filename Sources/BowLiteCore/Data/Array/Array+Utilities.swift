public extension Array {
    /// Accesses the element at a given index, safely.
    ///
    /// Index must be in the range [0, count) to be able to get or set the corresponding element in the array.
    ///
    /// - Parameter index: Integer number with the offset of the element in the array that wants to be accessed.
    /// - Returns: Optionally, the element located at that position in the array.
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

// MARK: Instance of Semigroup for Array

extension Array: Semigroup {
    public func combine(_ other: Array<Element>) -> Array<Element> {
        self + other
    }
}

// MARK: Instance of Monoid for Array

extension Array: Monoid {
    public static var empty: Array<Element> {
        []
    }
}
