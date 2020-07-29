import XCTest
import SwiftCheck
import BowLite

class IdMonadTest: XCTestCase {
    func testMonadLaws() {
        property("Monad left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Id<Int>.pure
            
            return Id.pure(a).flatMap(g)
                ==
            g(a)
        }
        
        property("Monad right identity") <~ forAll { (a: Int) in
            let fa = Id<Int>.pure(a)
            return fa.flatMap(Id.pure)
                ==
            fa
        }
        
        property("Kleisli left identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Id<Int>.pure
            
            return ({ (n: Int) in Id<Int>.pure(n) } >=> g)(a)
                ==
            g(a)
        }
        
        property("Kleisli right identity") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Id<Int>.pure
            
            return (g >=> Id.pure)(a)
                ==
            g(a)
        }
        
        property("Monad flatMap coherence") <~ forAll { (a: Int, f: ArrowOf<Int, Int>) in
            let g = f.getArrow >>> Id<Int>.pure
            let fa = Id<Int>.pure(a)
            
            return fa.flatMap(g)
                ==
            fa.map(f.getArrow)
        }
        
        property("Flatten") <~ forAll { (a: Int) in
            Id<Id<Int>>.pure(Id.pure(a)).flatten()
                ==
            Id<Int>.pure(a)
        }
    }
}
