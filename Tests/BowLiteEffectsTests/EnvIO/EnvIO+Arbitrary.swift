import Foundation
import SwiftCheck

import BowLiteCore
import BowLiteLaws
import BowLiteEffects

let envIOGen: Gen<EnvIO<Int, AnyError, Int>> = ioGen.map { io in EnvIO(constant(io)) }
