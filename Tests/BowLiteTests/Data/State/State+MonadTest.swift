import XCTest
import SwiftCheck
import BowLite

class StateMonadTest: XCTestCase {
    func testMonadLaws() {
        property("Monad left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> State<Int, Int>.pure
            
            return State.pure(a).flatMap(g)
                ==
            g(a)
        }
        
        property("Monad right identity") <~ forAll { (a: Int) in
            let fa = State<Int, Int>.pure(a)
            return fa.flatMap(State.pure)
                ==
            fa
        }
        
        property("Kleisli left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> State<Int, Int>.pure
            
            return ({ (n: Int) in State<Int, Int>.pure(n) } >=> g)(a)
                ==
            g(a)
        }
        
        property("Kleisli right identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> State<Int, Int>.pure
            
            return (g >=> State.pure)(a)
                ==
            g(a)
        }
        
        property("Monad flatMap coherence") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> State<Int, Int>.pure
            let fa = State<Int, Int>.pure(a)
            
            return fa.flatMap(g)
                ==
            fa.map(f.getArrow)
        }
        
        property("Flatten") <~ forAll { (a: Int) in
            State<Int, State<Int, Int>>.pure(State.pure(a)).flatten()
                ==
            State<Int, Int>.pure(a)
        }
    }
}
