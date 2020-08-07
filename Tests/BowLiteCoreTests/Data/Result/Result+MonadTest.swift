import XCTest
import SwiftCheck
import BowLiteLaws
import BowLiteCore

class ResultMonadTest: XCTestCase {
    func testMonadLaws() {
        property("Monad left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Result<Int, AnyError>.pure
            
            return Result.pure(a).flatMap(g)
                ==
            g(a)
        }
        
        property("Monad right identity") <~ forAll { (a: Int) in
            let fa = Result<Int, AnyError>.pure(a)
            return fa.flatMap(Result.pure)
                ==
            fa
        }
        
        property("Kleisli left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Result<Int, AnyError>.pure
            
            return ({ (n: Int) in Result<Int, AnyError>.pure(n) } >=> g)(a)
                ==
            g(a)
        }
        
        property("Kleisli right identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Result<Int, AnyError>.pure
            
            return (g >=> Result.pure)(a)
                ==
            g(a)
        }
        
        property("Monad flatMap coherence") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Result<Int, AnyError>.pure
            let fa = Result<Int, AnyError>.pure(a)
            
            return fa.flatMap(g)
                ==
            fa.map(f.getArrow)
        }
        
        property("Flatten") <~ forAll { (a: Int) in
            Result<Result<Int, AnyError>, AnyError>.pure(Result.pure(a)).flatten()
                ==
            Result<Int, AnyError>.pure(a)
        }
    }
}
