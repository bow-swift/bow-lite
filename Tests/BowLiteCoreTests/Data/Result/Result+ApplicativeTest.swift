import XCTest
import SwiftCheck
import BowLiteLaws
import BowLiteCore

class ResultApplicativeTest: XCTestCase {
    func testApplicativeLaws() {
        property("ap identity") <~ forAll() { (fa: Result<Int, AnyError>) in
            
            Result.pure(id).ap(fa)
                ==
            fa
        }
        
        property("homomorphism") <~ forAll() { (a: Int, f: ArrowOf<Int, Int>) in
            
            Result.pure(f.getArrow).ap(Result<Int, AnyError>.pure(a))
                ==
            Result.pure(f.getArrow(a))
        }
        
        property("interchange") <~ forAll() { (a: Int, b: Int) in
            let fa = Result<(Int) -> Int, AnyError>.pure(constant(a) as (Int) -> Int)
            
            return fa.ap(Result.pure(b))
                ==
            Result.pure({ (x: (Int) -> Int) in x(a) } ).ap(fa)
        }
        
        property("map derived") <~ forAll() { (fa: Result<Int, AnyError>, f: ArrowOf<Int, Int>) in
            
            fa.map(f.getArrow)
                ==
            Result.pure(f.getArrow).ap(fa)
        }

        property("Map with 2 inputs") <~ forAll { (a: Int, b: Int) in
            
            Result<Int, AnyError>.map(
                .pure(a),
                .pure(b)) { a1, b1 in
                    a1 + b1
            }
                ==
            Result<Int, AnyError>.pure(a + b)
        }
        
        property("Map with 3 inputs") <~ forAll { (a: Int, b: Int, c: Int) in
            
            Result<Int, AnyError>.map(
                .pure(a),
                .pure(b),
                .pure(c)) { a1, b1, c1 in
                    a1 + b1 + c1
            }
                ==
            Result<Int, AnyError>.pure(a + b + c)
        }
        
        property("Map with 4 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int) in
            
            Result<Int, AnyError>.map(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d)) { a1, b1, c1, d1 in
                    a1 + b1 + c1 + d1
            }
                ==
            Result<Int, AnyError>.pure(a + b + c + d)
        }
        
        property("Map with 5 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int) in
            
            Result<Int, AnyError>.map(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d),
                .pure(e)) { a1, b1, c1, d1, e1 in
                    a1 + b1 + c1 + d1 + e1
            }
                ==
            Result<Int, AnyError>.pure(a + b + c + d + e)
        }

        property("Map with 6 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) in
            
            Result<Int, AnyError>.map(
                .pure(a),
                .pure(b),
                .pure(c),
                .pure(d),
                .pure(e),
                .pure(f)) { a1, b1, c1, d1, e1, f1 in
                    a1 + b1 + c1 + d1 + e1 + f1
            }
                ==
            Result<Int, AnyError>.pure(a + b + c + d + e + f)
        }
        
        property("Map with 7 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int, f: Int, g: Int) in
            
            Result<Int, AnyError>.map(
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
            Result<Int, AnyError>.pure(a + b + c + d + e + f + g)
        }
        
        property("Map with 8 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int, f: Int, g: Int, h: Int) in
            
            Result<Int, AnyError>.map(
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
            Result<Int, AnyError>.pure(a + b + c + d + e + f + g + h)
        }
        
        property("Map with 9 inputs") <~ forAll { (a: Int, b: Int, c: Int, d: Int, e: Int, f: Int, g: Int, h: Int) in
            
            Result<Int, AnyError>.map(
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
            Result<Int, AnyError>.pure(a + b + c + d + e + f + g + h + a)
        }
    }
}
