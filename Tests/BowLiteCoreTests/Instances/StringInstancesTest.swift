import XCTest
import BowLiteCore
import BowLiteLaws

class StringInstancesTest: XCTestCase {
    
    func testEqLaws() {
        EquatableLaws<String>.check()
    }
    
    func testSemigroupLaws() {
        SemigroupLaws<String>.check()
    }
    
    func testMonoidLaws() {
        MonoidLaws<String>.check()
    }
}
