public extension Function where Input == Output {
    static func ask() -> Function<Input, Input> {
        Function(id)
    }
}

public extension Function {
    func local(_ f: @escaping (Input) -> Input) -> Function<Input, Output> {
        self.contramap(f)
    }
    
    static func reader(_ f: @escaping (Input) -> Output) -> Function<Input, Output> {
        Function(f)
    }
}
