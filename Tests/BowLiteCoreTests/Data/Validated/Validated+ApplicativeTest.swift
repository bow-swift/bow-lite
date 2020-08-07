import XCTest
import SwiftCheck
import BowLiteLaws
import BowLiteCore

class ValidatedApplicativeTest: XCTestCase {
    func testApplicativeLaws() {
        property("ap identity") <~ forAll() { (fa: Validated<Int, Int>) in
            
            Validated.pure(id).ap(fa)
                ==
            fa
        }
        
        property("homomorphism") <~ forAll() { (a: Int, f: ArrowOf<Int, Int>) in
            
            Validated.pure(f.getArrow).ap(Validated<Int, Int>.pure(a))
                ==
            Validated.pure(f.getArrow(a))
        }
        
        property("interchange") <~ forAll() { (a: Int, b: Int) in
            let fa = Validated<Int, (Int) -> Int>.pure(constant(a) as (Int) -> Int)
            
            return fa.ap(Validated.pure(b))
                ==
            Validated.pure({ (x: (Int) -> Int) in x(a) } ).ap(fa)
        }
        
        property("map derived") <~ forAll() { (fa: Validated<Int, Int>, f: ArrowOf<Int, Int>) in
            
            fa.map(f.getArrow)
                ==
            Validated.pure(f.getArrow).ap(fa)
        }

        property("Map with 2 inputs") <~ forAll { (a: Int, b: Int) in
            
            Validated<Int, Int>.map(
                .pure(a),
                .pure(b)) { a1, b1 in
                    a1 + b1
            }
                ==
            Validated<Int, Int>.pure(a + b)
        }
        
        property("Map with 3 inputs") <~ forAll { (a: Int, b: Int, c: Int) in
            
            Validated<Int, Int>.map(
                .pure(a),
                .pure(b),
                .pure(c)) { a1, b1, c1 in
                    a1 + b1 + c1
            }
                ==
            Validated<Int, Int>.pure(a + b + c)
        }
        
        property("Map with 4 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int) in
            
            Validated<Int, Int>.map(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d)) { a1, b1, c1, d1 in
                    a1 + b1 + c1 + d1
            }
                ==
            Validated<Int, Int>.pure(a + b + c + d)
        }
        
        property("Map with 5 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int) in
            
            Validated<Int, Int>.map(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d),
                .pure(e)) { a1, b1, c1, d1, e1 in
                    a1 + b1 + c1 + d1 + e1
            }
                ==
            Validated<Int, Int>.pure(a + b + c + d + e)
        }

        property("Map with 6 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) in
            
            Validated<Int, Int>.map(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d),
                .pure(e),
                .pure(f)) { a1, b1, c1, d1, e1, f1 in
                    a1 + b1 + c1 + d1 + e1 + f1
            }
                ==
            Validated<Int, Int>.pure(a + b + c + d + e + f)
        }
        
        property("Map with 7 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int, f: Int, g: Int) in
            
            Validated<Int, Int>.map(
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
            Validated<Int, Int>.pure(a + b + c + d + e + f + g)
        }
        
        property("Map with 8 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int, f: Int, g: Int, h: Int) in
            
            Validated<Int, Int>.map(
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
            Validated<Int, Int>.pure(a + b + c + d + e + f + g + h)
        }
        
        property("Map with 9 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int, f: Int, g: Int, h: Int) in
            
            Validated<Int, Int>.map(
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
            Validated<Int, Int>.pure(a + b + c + d + e + f + g + h + a)
        }
    }
}
