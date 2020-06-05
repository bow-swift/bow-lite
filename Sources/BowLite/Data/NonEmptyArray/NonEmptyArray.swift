public typealias NEA<Element> = NonEmptyArray<Element>

public struct NonEmptyArray<Element> {
    public let asArray: [Element]
    
    public init(_ first: Element, _ rest: Element...) {
        self.asArray = [first] + rest
    }
    
    public init?(from array: [Element]) {
        guard array.count > 0 else {
            return nil
        }
        self.asArray = array
    }
    
    public init(unsafe array: [Element]) {
        guard array.count > 0 else {
            fatalError("Attempted to initialize NonEmptyArray with an empty Array")
        }
        self.asArray = array
    }
    
    public static func +(lhs: NEA<Element>, rhs: NEA<Element>) -> NEA<Element> {
        NEA(unsafe: lhs.asArray + rhs.asArray)
    }
    
    public static func +(lhs: NEA<Element>, rhs: [Element]) -> NEA<Element> {
        NEA(unsafe: lhs.asArray + rhs)
    }
    
    public static func +(lhs: [Element], rhs: NEA<Element>) -> NEA<Element> {
        NEA(unsafe: lhs + rhs.asArray)
    }
    
    public var first: Element {
        self.asArray.first!
    }
    
    public var last: Element {
        self.asArray.last!
    }
    
    public var tail: [Element] {
        Array(self.asArray.dropFirst())
    }
    
    public subscript(safe index: Int) -> Element? {
        self.asArray[safe: index]
    }
}

public extension NonEmptyArray where Element: Equatable {
    func contains(_ element: Element) -> Bool {
        self.asArray.contains(element)
    }
    
    func containsAll(_ elements: [Element]) -> Bool {
        elements.map(contains).reduce(true, and)
    }
}
