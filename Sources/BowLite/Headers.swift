@_exported import BowLiteCore
@_exported import BowLiteEffects
@_exported import BowLiteOptics

precedencegroup KleisliCompositionPrecedence {
    associativity: left
}

infix operator >=>: KleisliCompositionPrecedence

precedencegroup CompositionPrecedence {
    associativity: left
}

infix operator <<<: CompositionPrecedence
infix operator >>>: CompositionPrecedence

precedencegroup PartialApplicationPrecedence {}

infix operator |> : PartialApplicationPrecedence

infix operator <- : AssignmentPrecedence
prefix operator |<-

// Using operator / to obtain prisms, as seen on
// Pointfree's Case Paths: https://github.com/pointfreeco/swift-case-paths
prefix operator /
