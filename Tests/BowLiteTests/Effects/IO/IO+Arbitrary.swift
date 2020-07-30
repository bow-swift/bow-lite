import SwiftCheck
import Foundation
@testable import BowLite

// IO cannot conform to Arbitrary as it is not a final class

private let pure: Gen<IO<AnyError, Int>> = Int.arbitrary.map(Pure.init)

private let raiseError: Gen<IO<AnyError, Int>> = AnyError.arbitrary.map(RaiseError.init)

private let handleErrorWith: Gen<IO<AnyError, Int>> =
    Gen.zip(baseIOGen, baseIOGen).map { io, result in
        HandleErrorWith(io, constant(result))
}

private let fmap: Gen<IO<AnyError, Int>> = Gen.zip(ArrowOf<Int, Int>.arbitrary, baseIOGen).map { arrow, io in
    FMap(arrow.getArrow, io)
}

private let join: Gen<IO<AnyError, Int>> = baseIOGen.map(Pure.init).map(Join.init)

private let asyncIO: Gen<IO<AnyError, Int>> = Gen.one(of: [
    Int.arbitrary.map { value in
        AsyncIO { callback in
            callback(.right(value))
            return IO.pure(())
        }
    },
    AnyError.arbitrary.map { error in
        AsyncIO { callback in
            callback(.left(error))
            return IO.pure(())
        }
    }
])

private let continueOn: Gen<IO<AnyError, Int>> =
    Gen.zip(baseIOGen, String.arbitrary.suchThat { str in !str.isEmpty }).map { io, label in
        ContinueOn(io, DispatchQueue(label: label))
}

private let bracket: Gen<IO<AnyError, Int>> = Gen.zip(baseIOGen, baseIOGen, baseIOGen).map { acquire, release, use in
    BracketIO(acquire, constant(release.void()), constant(use))
}

private let race: Gen<IO<AnyError, Int>> = baseIOGen.map { io in
    Race(io, IO<AnyError, Int>.never()).map { either in either.merge() }
}

private let parMap2: Gen<IO<AnyError, Int>> = Gen.zip(baseIOGen, baseIOGen).map { a, b in
    ParMap2(a, b, +)
}

private let parMap3: Gen<IO<AnyError, Int>> = Gen.zip(baseIOGen, baseIOGen, baseIOGen).map { a, b, c in
    ParMap3(a, b, c) { x, y, z in x + y + z }
}

private let suspend: Gen<IO<AnyError, Int>> = baseIOGen.map { io in Suspend { io } }

private let baseIOGen: Gen<IO<AnyError, Int>> = Gen.one(of: [pure, raiseError])

let ioGen: Gen<IO<AnyError, Int>> = Gen.one(of: [pure, raiseError, handleErrorWith, fmap, join, asyncIO, continueOn, bracket, race, parMap2, parMap3, suspend])
