import XCTest
import SwiftCheck
import BowLiteLaws
import BowLiteEffects

class EnvIOConcurrentTest: XCTestCase {
    func testConcurrentLaws() {
        property("ParMap with 2 inputs") <~ forAll { (a: Int, b: Int) in
            
            EnvIO<Int, AnyError, Int>.map(
                .pure(a),
                .pure(b)) { a1, b1 in
                    a1 + b1
            }
                ==
            EnvIO<Int, AnyError, Int>.parMap(
                .pure(a),
                .pure(b)) { a1, b1 in
                    a1 + b1
            }
        }
        
        property("ParMap with 3 inputs") <~ forAll { (a: Int, b: Int, c: Int) in
            
            EnvIO<Int, AnyError, Int>.map(
                .pure(a),
                .pure(b),
                .pure(c)) { a1, b1, c1 in
                    a1 + b1 + c1
            }
                ==
            EnvIO<Int, AnyError, Int>.parMap(
                .pure(a),
                .pure(b),
                .pure(c)) { a1, b1, c1 in
                    a1 + b1 + c1
            }
        }
        
        property("ParMap with 4 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int) in
            
            EnvIO<Int, AnyError, Int>.map(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d)) { a1, b1, c1, d1 in
                    a1 + b1 + c1 + d1
            }
                ==
            EnvIO<Int, AnyError, Int>.parMap(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d)) { a1, b1, c1, d1 in
                    a1 + b1 + c1 + d1
            }
        }
        
        property("ParMap with 5 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int) in
            
            EnvIO<Int, AnyError, Int>.map(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d),
                .pure(e)) { a1, b1, c1, d1, e1 in
                    a1 + b1 + c1 + d1 + e1
            }
                ==
            EnvIO<Int, AnyError, Int>.parMap(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d),
                .pure(e)) { a1, b1, c1, d1, e1 in
                    a1 + b1 + c1 + d1 + e1
            }
        }

        property("ParMap with 6 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) in
            
            EnvIO<Int, AnyError, Int>.map(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d),
                .pure(e),
                .pure(f)) { a1, b1, c1, d1, e1, f1 in
                    a1 + b1 + c1 + d1 + e1 + f1
            }
                ==
            EnvIO<Int, AnyError, Int>.parMap(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d),
                .pure(e),
                .pure(f)) { a1, b1, c1, d1, e1, f1 in
                    a1 + b1 + c1 + d1 + e1 + f1
            }
        }
        
        property("ParMap with 7 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int, f: Int, g: Int) in
            
            EnvIO<Int, AnyError, Int>.map(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d),
                .pure(e),
                .pure(f),
                .pure(g)) { a1, b1, c1, d1, e1, f1, g1 in
                    a1 + b1 + c1 + d1 + e1 + f1 + g1
            }
                ==
            EnvIO<Int, AnyError, Int>.parMap(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d),
                .pure(e),
                .pure(f),
                .pure(g)) { a1, b1, c1, d1, e1, f1, g1 in
                    a1 + b1 + c1 + d1 + e1 + f1 + g1
            }
        }
        
        property("ParMap with 8 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int, f: Int, g: Int, h: Int) in
            
            EnvIO<Int, AnyError, Int>.map(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d),
                .pure(e),
                .pure(f),
                .pure(g),
                .pure(h)) { a1, b1, c1, d1, e1, f1, g1, h1 in
                    a1 + b1 + c1 + d1 + e1 + f1 + g1 + h1
            }
                ==
            EnvIO<Int, AnyError, Int>.parMap(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d),
                .pure(e),
                .pure(f),
                .pure(g),
                .pure(h)) { a1, b1, c1, d1, e1, f1, g1, h1 in
                    a1 + b1 + c1 + d1 + e1 + f1 + g1 + h1
            }
        }
        
        property("ParMap with 9 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int, f: Int, g: Int, h: Int) in
            
            EnvIO<Int, AnyError, Int>.map(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d),
                .pure(e),
                .pure(f),
                .pure(g),
                .pure(h),
                .pure(a)) { a1, b1, c1, d1, e1, f1, g1, h1, i1 in
                    a1 + b1 + c1 + d1 + e1 + f1 + g1 + h1 + i1
            }
                ==
            EnvIO<Int, AnyError, Int>.parMap(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d),
                .pure(e),
                .pure(f),
                .pure(g),
                .pure(h),
                .pure(a)) { a1, b1, c1, d1, e1, f1, g1, h1, i1 in
                    a1 + b1 + c1 + d1 + e1 + f1 + g1 + h1 + i1
            }
        }
    }
}
