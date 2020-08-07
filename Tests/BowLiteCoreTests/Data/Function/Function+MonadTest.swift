import XCTest
import SwiftCheck
import BowLiteLaws
import BowLiteCore

class FunctionMonadTest: XCTestCase {
    func testMonadLaws() {
        property("Monad left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Function<Int, Int>.pure
            
            return Function.pure(a).flatMap(g)
                ==
            g(a)
        }
        
        property("Monad right identity") <~ forAll { (a: Int) in
            let fa = Function<Int, Int>.pure(a)
            return fa.flatMap(Function.pure)
                ==
            fa
        }
        
        property("Kleisli left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Function<Int, Int>.pure
            
            return ({ (n: Int) in Function<Int, Int>.pure(n) } >=> g)(a)
                ==
            g(a)
        }
        
        property("Kleisli right identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Function<Int, Int>.pure
            
            return (g >=> Function.pure)(a)
                ==
            g(a)
        }
        
        property("Monad flatMap coherence") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Function<Int, Int>.pure
            let fa = Function<Int, Int>.pure(a)
            
            return fa.flatMap(g)
                ==
            fa.map(f.getArrow)
        }
        
        property("Flatten") <~ forAll { (a: Int) in
            Function<Int, Function<Int, Int>>.pure(Function.pure(a)).flatten()
                ==
            Function<Int, Int>.pure(a)
        }
    }
}
