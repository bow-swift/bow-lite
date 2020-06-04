public extension Ior where Left: Semigroup {
    func flatMap<A>(_ f: @escaping (Right) -> Ior<Left, A>) -> Ior<Left, A> {
        fold(
            Ior<Left, A>.left,
            f,
            { l, r in
                f(r).fold(
                    { l2 in Ior<Left, A>.left(l.combine(l2)) },
                    Ior<Left, A>.right,
                    { l2, r2 in Ior<Left, A>.both(l.combine(l2), r2) })
            }
        )
    }
    
    func flatten<A>() -> Ior<Left, A> where Right == Ior<Left, A> {
        self.flatMap(id)
    }
    
    func followedBy<A>(_ fa: Ior<Left, A>) -> Ior<Left, A> {
        self.flatMap(constant(fa))
    }
    
    func forEffect<A>(_ fa: Ior<Left, A>) -> Ior<Left, Right> {
        self.flatMap { wrapped in fa.as(wrapped) }
    }
    
    func mproduct<A>(_ f: @escaping (Right) -> Ior<Left, A>) -> Ior<Left, (Right, A)> {
        self.flatMap { wrapped in
            f(wrapped).tupleLeft(wrapped)
        }
    }
    
    func `if`<A>(
        then f: @escaping () -> Ior<Left, A>,
        else g: @escaping () -> Ior<Left, A>
    ) -> Ior<Left, A> where Right == Bool {
        self.flatMap { boolean in
            boolean ? f() : g()
        }
    }
    
    func flatTap<A>(_ f: @escaping (Right) -> Ior<Left, A>) -> Ior<Left, Right> {
        self.flatMap { wrapped in f(wrapped).as(wrapped) }
    }
}
