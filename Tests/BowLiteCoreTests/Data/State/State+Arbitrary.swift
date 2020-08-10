import SwiftCheck
import BowLiteLaws
import BowLiteCore

extension State: Arbitrary where StateType: Hashable & CoArbitrary & Arbitrary, Value: Arbitrary {
    public static var arbitrary: Gen<State<StateType, Value>> {
        ArrowOf<StateType, Tuple<StateType, Value>>.arbitrary.map { arrow in
            State { state in
                let pair = arrow.getArrow(state)
                return (pair.first, pair.second)
            }
        }
    }
}

private struct Tuple<A, B> {
    let first: A
    let second: B
}

extension Tuple: Arbitrary where A: Arbitrary, B: Arbitrary {
    static var arbitrary: Gen<Tuple<A, B>> {
        Gen.zip(A.arbitrary, B.arbitrary).map(Tuple.init)
    }
}
