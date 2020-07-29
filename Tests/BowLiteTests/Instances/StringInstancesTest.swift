import XCTest
import BowLite

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
