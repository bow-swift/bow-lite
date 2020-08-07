/// Abbreviation for `NonEmptyArray`.
public typealias NEA<Element> = NonEmptyArray<Element>

/// A NonEmptyArray is an array of elements that guarantees to have at least one element.
public struct NonEmptyArray<Element> {
    public let asArray: [Element]
    
    /// Creates a non-empty array from several values.
    ///
    /// - Parameters:
    ///   - first: First element for the non-empty array.
    ///   - rest: Variable number of values for the rest of the non-empty array.
    public init(_ first: Element, _ rest: Element...) {
        self.asArray = [first] + rest
    }
    
    /// Creates a non-empty array from a Swift array.
    ///
    /// - Parameter array: A Swift array.
    public init?(from array: [Element]) {
        guard array.count > 0 else {
            return nil
        }
        self.asArray = array
    }
    
    /// Unsafely creates a non-empty array from a Swift array.
    ///
    /// This function may cause a fatal error if the argument is an empty array.
    ///
    /// - Parameter array: A Swift array.
    public init(unsafe array: [Element]) {
        guard array.count > 0 else {
            fatalError("Attempted to initialize NonEmptyArray with an empty Array")
        }
        self.asArray = array
    }
    
    /// Concatenates two non-empty arrays.
    ///
    /// - Parameters:
    ///   - lhs: Left hand side of the concatenation.
    ///   - rhs: Right hand side of the concatenation.
    /// - Returns: A non-empty array that contains the elements of the two arguments in the same order.
    public static func +(lhs: NEA<Element>, rhs: NEA<Element>) -> NEA<Element> {
        NEA(unsafe: lhs.asArray + rhs.asArray)
    }
    
    /// Concatenates a non-empty array with a Swift array.
    ///
    /// - Parameters:
    ///   - lhs: A non-empty array.
    ///   - rhs: A Swift array.
    /// - Returns: A non-empty array that contains the elements of the two arguments in the same order.
    public static func +(lhs: NEA<Element>, rhs: [Element]) -> NEA<Element> {
        NEA(unsafe: lhs.asArray + rhs)
    }
    
    /// Concatenates a non-empty array with a Swift array.
    ///
    /// - Parameters:
    ///   - lhs: A Swift array.
    ///   - rhs: A non-empty array.
    /// - Returns: A non-empty array that contains the elements of the two arguments in the same order.
    public static func +(lhs: [Element], rhs: NEA<Element>) -> NEA<Element> {
        NEA(unsafe: lhs + rhs.asArray)
    }
    
    /// Obtains the first element of the array.
    public var first: Element {
        self.asArray.first!
    }
    
    /// Obtains the last element of the array.
    public var last: Element {
        self.asArray.last!
    }
    
    /// Obtains an array with all element
    public var tail: [Element] {
        Array(self.asArray.dropFirst())
    }
    
    /// Obtains an element from its position in this non-empty array.
    ///
    /// - Parameter index: Index of the object to obtain.
    public subscript(safe index: Int) -> Element? {
        self.asArray[safe: index]
    }
}

public extension NonEmptyArray where Element: Equatable {
    /// Checks if an element appears in this array.
    ///
    /// - Parameter element: Element to look for in the array.
    /// - Returns: Boolean value indicating if the element appears in the array or not.
    func contains(_ element: Element) -> Bool {
        self.asArray.contains(element)
    }
    
    /// Checks if all the elements of an array appear in this array.
    ///
    /// - Parameter elements: Elements to look for in the array.
    /// - Returns: Boolean value indicating if all elements appear in the array or not.
    func containsAll(_ elements: [Element]) -> Bool {
        elements.map(contains).reduce(true, and)
    }
}

// MARK: Instance of Semigroup for NonEmptyArray
extension NonEmptyArray: Semigroup {
    public func combine(_ other: NonEmptyArray<Element>) -> NonEmptyArray<Element> {
        self + other
    }
}

// MARK: Conformance of Equatable for NonEmptyArray
extension NonEmptyArray: Equatable where Element: Equatable {}

// MARK: Conformance of CustomStringConvertible for NonEmptyArray
extension NonEmptyArray: CustomStringConvertible where Element: CustomStringConvertible {
    public var description: String {
        "NEA(\(asArray.description))"
    }
}
