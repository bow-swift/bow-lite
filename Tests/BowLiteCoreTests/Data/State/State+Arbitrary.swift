import SwiftCheck
import BowLiteLaws
import BowLiteCore

extension State: Arbitrary where StateType: Hashable & Arbitrary & CoArbitrary, Value: Arbitrary {
    public static var arbitrary: Gen<State<StateType, Value>> {
        Gen.zip(ArrowOf<StateType, StateType>.arbitrary,
                ArrowOf<StateType, Value>.arbitrary).map { f, g in
            State { state in
                (f.getArrow(state), g.getArrow(state))
            }
        }
    }
}
