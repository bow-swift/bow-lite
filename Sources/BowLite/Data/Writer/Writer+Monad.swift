public extension Writer where Accumulator: Monoid {
    func flatMap<A>(_ f: @escaping (Value) -> Writer<Accumulator, A>) -> Writer<Accumulator, A> {
        let new = f(self.value)
        return Writer<Accumulator, A>(self.accumulator.combine(new.accumulator), new.value)
    }
    
    func flatten<A>() -> Writer<Accumulator, A> where Value == Writer<Accumulator, A> {
        self.flatMap(id)
    }
    
    func followedBy<A>(_ fa: Writer<Accumulator, A>) -> Writer<Accumulator, A> {
        self.flatMap(constant(fa))
    }
    
    func forEffect<A>(_ fa: Writer<Accumulator, A>) -> Writer<Accumulator, Value> {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    func mproduct<A>(_ f: @escaping (Value) -> Writer<Accumulator, A>) -> Writer<Accumulator, (Value, A)> {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    func `if`<A>(
        then f: @escaping () -> Writer<Accumulator, A>,
        else g: @escaping () -> Writer<Accumulator, A>
    ) -> Writer<Accumulator, A> where Value == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    func flatTap<A>(_ f: @escaping (Value) -> Writer<Accumulator, A>) -> Writer<Accumulator, Value> {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
