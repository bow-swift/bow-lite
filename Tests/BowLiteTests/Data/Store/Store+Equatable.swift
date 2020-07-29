import BowLite

extension Store: Equatable where View: Equatable {
    public static func ==(lhs: Store<State, View>, rhs: Store<State, View>) -> Bool {
        lhs.extract() == rhs.extract()
    }
}
