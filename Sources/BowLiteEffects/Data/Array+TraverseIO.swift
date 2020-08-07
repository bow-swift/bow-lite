import Foundation
import BowLiteCore

public extension Array {
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<E: Error, A>(_ f: @escaping (Element) -> IO<E, A>) -> IO<E, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<E: Error, A>() -> IO<E, [A]> where Element == IO<E, A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<E: Error, A>(_ f: @escaping (Element) -> IO<E, [A]>) -> IO<E, [A]> {
        traverse(f).map { array in array.flatten() }
    }
    
    // MARK: Traverse for EnvIO
    
    /// Maps each element of this structure to an effect, evaluates them from left to right and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func traverse<D, E: Error, A>(_ f: @escaping (Element) -> EnvIO<D, E, A>) -> EnvIO<D, E, [A]> {
        self.reduce(.pure([])) { partial, next in
            .map(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func sequence<D, E: Error, A>() -> EnvIO<D, E, [A]> where Element == EnvIO<D, E, A> {
        traverse(id)
    }
    
    /// A traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func flatTraverse<D, E: Error, A>(_ f: @escaping (Element) -> EnvIO<D, E, [A]>) -> EnvIO<D, E, [A]> {
        traverse(f).map { array in array.flatten() }
    }
}
