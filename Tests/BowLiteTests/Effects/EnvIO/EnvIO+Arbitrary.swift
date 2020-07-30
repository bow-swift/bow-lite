import SwiftCheck
import BowLite

let envIOGen: Gen<EnvIO<Int, AnyError, Int>> = ioGen.map { io in EnvIO(constant(io)) }
