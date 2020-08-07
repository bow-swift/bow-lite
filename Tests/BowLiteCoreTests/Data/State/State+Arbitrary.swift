import SwiftCheck
import BowLiteLaws
import BowLiteCore

extension State: Arbitrary where StateType: Hashable & Arbitrary & CoArbitrary, Value: Arbitrary {
    
    public static var arbitrary: Gen<State<StateType, Value>> {
        ArrowOf<StateType, Pair<StateType, Value>>.arbitrary.map { arrow in
            State { state in
                let pair = arrow.getArrow(state)
                return (pair.first, pair.second)
            }
        }
    }
}
