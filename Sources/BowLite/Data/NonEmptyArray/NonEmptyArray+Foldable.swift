public extension NonEmptyArray {
    /// Eagerly folds this structure to a summary value from left to right.
    ///
    /// - Parameters:
    ///   - initialValue: Initial value for the folding process.
    ///   - combine: Folding function.
    /// - Returns: Summary value resulting from the folding process.
    func reduce<B>(
        _ initialValue: B,
        _ combine: @escaping (B, Element) -> B
    ) -> B {
        self.asArray.reduce(initialValue, combine)
    }
    
    /// Eagerly folds this structure to a summary value from left to right.
    ///
    /// - Parameters:
    ///   - initialValue: Initial value for the folding process.
    ///   - combine: Folding function.
    /// - Returns: Summary value resulting from the folding process.
    func foldLeft<B>(
        _ initialValue: B,
        _ combine: @escaping (B, Element) -> B
    ) -> B {
        self.reduce(initialValue, combine)
    }
    
    /// Lazily folds this structure to a summary value from right to left.
    ///
    /// - Parameters:
    ///   - initialValue: Initial value for the folding process.
    ///   - combine: Folding function.
    /// - Returns: Summary value resulting from the folding process.
    func foldRight<B>(
        _ initialValue: Eval<B>,
        _ combine: @escaping (Element, Eval<B>) -> Eval<B>
    ) -> Eval<B> {
        self.asArray.foldRight(initialValue, combine)
    }
    
    /// Reduces the elements of this structure down to a single value by applying the provided transformation and aggregation funtions in a left-associative manner.
    ///
    /// - Parameters:
    ///   - transform: Transforming function.
    ///   - combine: Folding function.
    /// - Returns: Optional summary value resulting from the folding process. It will be `nil` if the structure is empty, or a value if not.
    func reduceLeftToOptional<B>(
        _ transform: @escaping (Element) -> B,
        _ combine: @escaping (B, Element) -> B
    ) -> B? {
        self.reduce(nil) { partial, next in
            partial.fold(
                { transform(next) },
                { result in combine(result, next) }
            )
        }
    }
    
    /// Reduces the elements of this structure down to a single value by applying the provided aggregation function in a left-associative manner.
    ///
    /// - Parameters:
    ///   - combine: Folding function.
    /// - Returns: Optional summary value resulting from the folding process.
    func reduceLeftOptional(
        _ combine: @escaping (Element, Element) -> Element
    ) -> Element? {
        reduceLeftToOptional(id, combine)
    }
    
    /// Transforms the elements of this structure to a type with a `Monoid` instance and folds them using the empty and combine methods of such `Monoid` instance.
    ///
    /// - Parameters:
    ///   - transform: Transforming function.
    /// - Returns: Summary value resulting from the transformation and folding process.
    func foldMap<B: Monoid>(
        _ transform: @escaping (Element) -> B
    ) -> B {
        self.reduce(B.empty) { partial, next in
            partial.combine(transform(next))
        }
    }
    
    /// Looks for an element that matches a given predicate.
    ///
    /// - Parameters:
    ///   - predicate: Predicate to match a value.
    /// - Returns: A value if there is any that matches the predicate, or `nil` otherwise.
    func find(_ predicate: @escaping (Element) -> Bool) -> Element? {
        self.reduce(nil) { partial, next in
            partial.fold(
                { predicate(next) ? next : nil },
                id)
        }
    }
    
    /// Checks if any element in this structure matches a given predicate.
    ///
    /// - Parameters:
    ///   - predicate: Predicate.
    /// - Returns: A boolean value indicating if any element in the structure match the predicate.
    func exists(_ predicate: @escaping (Element) -> Bool) -> Bool {
        self.reduce(false) { partial, next in
            partial || predicate(next)
        }
    }
    
    /// Checks if all elements in a structure match a given predicate.
    ///
    /// - Parameters:
    ///   - predicate: Predicate.
    /// - Returns: A boolean value indicating if all elements in the structure match the predicate.
    func forAll(_ predicate: @escaping (Element) -> Bool) -> Bool {
        self.reduce(true) { partial, next in
            partial && predicate(next)
        }
    }
}

public extension NonEmptyArray where Element: Monoid {
    /// Folds this structure of values provided that its type has an instance of `Monoid`.
    ///
    /// It uses the monoid empty value as initial value and the combination method for the fold.
    ///
    /// - Returns: Summary value resulting from the folding process.
    func fold() -> Element {
        self.reduce(Element.empty, Element.combine)
    }
    
    /// Folds this structure of values provided that its type has an instance of `Monoid`.
    ///
    /// It uses the monoid empty value as initial value and the combination method for the fold.
    ///
    /// - Returns: Summary value resulting from the folding process.
    func combineAll() -> Element {
        fold()
    }
}
