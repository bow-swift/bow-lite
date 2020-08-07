import SwiftCheck
import BowLiteLaws
import BowLiteCore

// Eval cannot conform to Arbitrary as it is not a final class

private let now = Int.arbitrary.map(Eval.now)
private let later = Int.arbitrary.map { value in Eval.later { value } }
private let always = Int.arbitrary.map { value in Eval.always { value } }
let evalGen = Gen.one(of: [now, later, always])
