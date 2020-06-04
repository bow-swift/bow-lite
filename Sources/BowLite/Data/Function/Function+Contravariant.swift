public extension Function {
    static func contralift<A>(_ f: @escaping (A) -> Input) -> (Function<Input, Output>) -> Function<A, Output> {
        { function in function.contramap(f) }
    }
}
