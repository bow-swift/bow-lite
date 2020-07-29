import SwiftCheck
import BowLite

extension Store: Arbitrary where State: Hashable & Arbitrary & CoArbitrary, View: Arbitrary {
    public static var arbitrary: Gen<Store<State, View>> {
        Gen.zip(State.arbitrary, ArrowOf<State, View>.arbitrary).map { state, arrow in
            Store(state: state, render: arrow.getArrow)
        }
    }
}
