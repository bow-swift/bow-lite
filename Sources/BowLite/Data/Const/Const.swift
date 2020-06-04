public struct Const<Constant, Variable> {
    public let value: Constant
    
    public init(_ value: Constant) {
        self.value = value
    }
    
    public func retag<Other>() -> Const<Constant, Other> {
        Const<Constant, Other>(value)
    }
}
