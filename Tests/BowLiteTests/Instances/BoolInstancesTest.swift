import XCTest
import BowLite

class BoolInstancesTest: XCTestCase {

    func testBoolEqLaws() {
        EquatableLaws<Bool>.check()
    }
    
    func testBoolSemiringLaws() {
        SemiringLaws<Bool>.check()
    }
}
