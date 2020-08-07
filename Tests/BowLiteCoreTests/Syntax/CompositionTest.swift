import XCTest
import SwiftCheck
import BowLiteCore
import BowLiteLaws

class CompostionTest : XCTestCase {
    
    func testComposition() {
        property("Function composition is equal to applying functions sequentially") <~ forAll() { (a : Int, g : ArrowOf<Int, String>) in
            let f = constant(a)
            let x1 = f()
            let x2 = g.getArrow(x1)
            return x2 == (g.getArrow <<< f)()
        }
        
        property("Function composition is equal to applying functions sequentially") <~ forAll() { (f : ArrowOf<Int, Int>, g : ArrowOf<Int, String>, x1 : Int) in
            let x2 = f.getArrow(x1)
            let x3 = g.getArrow(x2)
            return x3 == (g.getArrow <<< f.getArrow)(x1)
        }
        
        property("Function composition is equal to applying functions sequentially") <~ forAll() { (a : Int, g : ArrowOf<Int, String>) in
            let f = constant(a)
            let x1 = f()
            let x2 = g.getArrow(x1)
            return x2 == compose(g.getArrow, f)()
        }
        
        property("Function composition is equal to applying functions sequentially") <~ forAll() { (f : ArrowOf<Int, Int>, g : ArrowOf<Int, String>, x1 : Int) in
            let x2 = f.getArrow(x1)
            let x3 = g.getArrow(x2)
            return x3 == compose(g.getArrow, f.getArrow)(x1)
        }
        
        property("Function composition is associative") <~ forAll() { (f : ArrowOf<Int, Int>, g : ArrowOf<Int, Int>, h : ArrowOf<Int, Int>, x : Int) in
            
            return ((h.getArrow <<< g.getArrow) <<< f.getArrow)(x) == (h.getArrow <<< (g.getArrow <<< f.getArrow))(x)
        }
    }
}
