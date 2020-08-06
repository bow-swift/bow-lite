import XCTest
import SwiftCheck
import BowLiteLaws
import BowLiteCore

class EitherMonadTest: XCTestCase {
    func testMonadLaws() {
        property("Monad left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Either<Int, Int>.pure
            
            return Either.pure(a).flatMap(g)
                ==
            g(a)
        }
        
        property("Monad right identity") <~ forAll { (a: Int) in
            let fa = Either<Int, Int>.pure(a)
            return fa.flatMap(Either.pure)
                ==
            fa
        }
        
        property("Kleisli left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Either<Int, Int>.pure
            
            return ({ (n: Int) in Either<Int, Int>.pure(n) } >=> g)(a)
                ==
            g(a)
        }
        
        property("Kleisli right identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Either<Int, Int>.pure
            
            return (g >=> Either.pure)(a)
                ==
            g(a)
        }
        
        property("Monad flatMap coherence") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Either<Int, Int>.pure
            let fa = Either<Int, Int>.pure(a)
            
            return fa.flatMap(g)
                ==
            fa.map(f.getArrow)
        }
        
        property("Flatten") <~ forAll { (a: Int) in
            Either<Int, Either<Int, Int>>.pure(Either.pure(a)).flatten()
                ==
            Either<Int, Int>.pure(a)
        }
    }
}
