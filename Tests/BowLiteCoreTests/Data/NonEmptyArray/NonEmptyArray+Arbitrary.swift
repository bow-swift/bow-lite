import SwiftCheck
import BowLiteLaws
import BowLiteCore

extension NonEmptyArray: Arbitrary where Element: Arbitrary {
    public static var arbitrary: Gen<NonEmptyArray<Element>> {
        Array.arbitrary.suchThat { array in
            array.count > 0
        }.map(NEA.init(unsafe:))
    }
}
