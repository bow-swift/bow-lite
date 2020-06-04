public struct Function<Input, Output> {
    private let f: (Input) -> Output
    
    public init(_ f: @escaping (Input) -> Output) {
        self.f = f
    }
    
    public func callAsFunction(_ input: Input) -> Output {
        f(input)
    }
    
    public func andThen<A>(_ other: Function<Output, A>) -> Function<Input, A> {
        Function<Input, A>(self.f >>> other.f)
    }
    
    public func dimap<A, B>(
        _ pre: @escaping (A) -> Input,
        _ post: @escaping (Output) -> B
    ) -> Function<A, B> {
        Function<A, B>(pre >>> self.f >>> post)
    }
    
    public func map<B>(_ f: @escaping (Output) -> B) -> Function<Input, B> {
        dimap(id, f)
    }
    
    public func contramap<A>(_ f: @escaping (A) -> Input) -> Function<A, Output> {
        dimap(f, id)
    }
}
