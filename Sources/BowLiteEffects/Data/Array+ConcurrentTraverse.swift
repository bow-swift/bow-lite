import Foundation
import BowLiteCore

public extension Array {
    // MARK: Concurrent Traverse for IO
    
    /// Maps each element of this structure to an effect, evaluates themin parallel and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func parTraverse<Failure, Success>(
        _ f: @escaping (Element) -> IO<Failure, Success>
    ) -> IO<Failure, [Success]> {
        self.reduce(.pure([])) { partial, next in
            .parMap(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values in parallel and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func parSequence<Failure, Success>() -> IO<Failure, [Success]> where Element == IO<Failure, Success> {
        parTraverse(id)
    }
    
    /// A parallel traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func parFlatTraverse<Failure, Success>(
        _ f: @escaping (Element) -> IO<Failure, [Success]>
    ) -> IO<Failure, [Success]> {
        parTraverse(f).map { array in array.flatten() }
    }
    
    // MARK: Concurrent Traverse for EnvIO
    
    /// Maps each element of this structure to an effect, evaluates themin parallel and collects the results.
    ///
    /// - Parameters:
    ///   - f: A function producing an effect.
    /// - Returns: Results collected under the context of the effect provided by the function.
    func parTraverse<Dependencies, Failure, Success>(
        _ f: @escaping (Element) -> EnvIO<Dependencies, Failure, Success>
    ) -> EnvIO<Dependencies, Failure, [Success]> {
        self.reduce(.pure([])) { partial, next in
            .parMap(partial, f(next)) { array, a in
                array + [a]
            }
        }
    }
    
    /// Evaluate each effect in this structure of values in parallel and collects the results.
    ///
    /// - Returns: Results collected under the context of the inner effects.
    func parSequence<Dependencies, Failure, Success>() -> EnvIO<Dependencies, Failure, [Success]> where Element == EnvIO<Dependencies, Failure, Success> {
        parTraverse(id)
    }
    
    /// A parallel traverse followed by flattening the inner result.
    ///
    /// - Parameters:
    ///   - f: A transforming function yielding nested effects.
    /// - Returns: Results collected and flattened under the context of the effects.
    func parFlatTraverse<Dependencies, Failure, Success>(
        _ f: @escaping (Element) -> EnvIO<Dependencies, Failure, [Success]>
    ) -> EnvIO<Dependencies, Failure, [Success]> {
        parTraverse(f).map { array in array.flatten() }
    }
}
