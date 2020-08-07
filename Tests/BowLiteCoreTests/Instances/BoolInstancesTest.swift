import XCTest
import BowLiteCore
import BowLiteLaws

class BoolInstancesTest: XCTestCase {

    func testBoolEqLaws() {
        EquatableLaws<Bool>.check()
    }
    
    func testBoolSemiringLaws() {
        SemiringLaws<Bool>.check()
    }
}
