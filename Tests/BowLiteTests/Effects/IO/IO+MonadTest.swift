import XCTest
import SwiftCheck
import BowLite

class IOMonadTest: XCTestCase {
    func testMonadLaws() {
        property("Monad left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> IO<AnyError, Int>.pure
            
            return IO.pure(a).flatMap(g)
                ==
            g(a)
        }
        
        property("Monad right identity") <~ forAll { (a: Int) in
            let fa = IO<AnyError, Int>.pure(a)
            return fa.flatMap(IO.pure)
                ==
            fa
        }
        
        property("Kleisli left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> IO<AnyError, Int>.pure
            
            return ({ (n: Int) in IO<AnyError, Int>.pure(n) } >=> g)(a)
                ==
            g(a)
        }
        
        property("Kleisli right identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> IO<AnyError, Int>.pure
            
            return (g >=> IO.pure)(a)
                ==
            g(a)
        }
        
        property("Monad flatMap coherence") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> IO<AnyError, Int>.pure
            let fa = IO<AnyError, Int>.pure(a)
            
            return fa.flatMap(g)
                ==
            fa.map(f.getArrow)
        }
        
        property("Flatten") <~ forAll { (a: Int) in
            IO<AnyError, IO<AnyError, Int>>.pure(IO.pure(a)).flatten()
                ==
            IO<AnyError, Int>.pure(a)
        }
    }
}
