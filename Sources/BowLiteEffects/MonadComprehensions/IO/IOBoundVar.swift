/// A bound variable is a variable to be used in a monad comprehesion to bind the produced values by a monadic effect.
public class IOBoundVar<Failure: Error, Value> {
    private var value: Value? = nil
    
    /// Makes a bound variable.
    ///
    /// - Returns: A bound variable.
    public static func make() -> IOBoundVar<Failure, Value> {
        IOBoundVar()
    }
    
    internal init() {}
    
    internal func bind(_ value: Value) {
        self.value = value
    }
    
    /// Obtains the value that has been bound to this variable.
    ///
    /// If no value has been bound to the variable when this property is invoked, a fatal error is triggered.
    public var get: Value {
        return value!
    }
    
    internal var erased: IOBoundVar<Failure, Any> {
        IOErasedBoundVar<Failure, Value>(self)
    }
}

public extension IO {
    /// Creates a bound variable in this monadic context for the specified type.
    ///
    /// - Returns: A bound variable.
    static func `var`() -> IOBoundVar<Failure, Success> {
        .make()
    }
}

private class IOErasedBoundVar<Failure: Error, Value>: IOBoundVar<Failure, Any> {
    private var boundVar: IOBoundVar<Failure, Value>
    
    fileprivate init(_ boundVar: IOBoundVar<Failure, Value>) {
        self.boundVar = boundVar
    }
    
    override func bind(_ value: Any) {
        boundVar.bind(value as! Value)
    }
}

internal class IOBoundVar2<Failure: Error, A, B>: IOBoundVar<Failure, (A, B)> {
    let a: IOBoundVar<Failure, A>
    let b: IOBoundVar<Failure, B>
    
    init(_ a: IOBoundVar<Failure, A>,
         _ b: IOBoundVar<Failure, B>) {
        self.a = a
        self.b = b
    }
    
    override func bind(_ value: (A, B)) {
        self.a.bind(value.0)
        self.b.bind(value.1)
    }
}

internal class IOBoundVar3<Failure: Error, A, B, C>: IOBoundVar<Failure, (A, B, C)> {
    let a: IOBoundVar<Failure, A>
    let b: IOBoundVar<Failure, B>
    let c: IOBoundVar<Failure, C>
    
    init(_ a: IOBoundVar<Failure, A>,
         _ b: IOBoundVar<Failure, B>,
         _ c: IOBoundVar<Failure, C>) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    override func bind(_ value: (A, B, C)) {
        self.a.bind(value.0)
        self.b.bind(value.1)
        self.c.bind(value.2)
    }
}

internal class IOBoundVar4<Failure: Error, A, B, C, D>: IOBoundVar<Failure, (A, B, C, D)> {
    let a: IOBoundVar<Failure, A>
    let b: IOBoundVar<Failure, B>
    let c: IOBoundVar<Failure, C>
    let d: IOBoundVar<Failure, D>
    
    init(_ a: IOBoundVar<Failure, A>,
         _ b: IOBoundVar<Failure, B>,
         _ c: IOBoundVar<Failure, C>,
         _ d: IOBoundVar<Failure, D>) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
    
    override func bind(_ value: (A, B, C, D)) {
        self.a.bind(value.0)
        self.b.bind(value.1)
        self.c.bind(value.2)
        self.d.bind(value.3)
    }
}

internal class IOBoundVar5<Failure: Error, A, B, C, D, E>: IOBoundVar<Failure, (A, B, C, D, E)> {
    let a: IOBoundVar<Failure, A>
    let b: IOBoundVar<Failure, B>
    let c: IOBoundVar<Failure, C>
    let d: IOBoundVar<Failure, D>
    let e: IOBoundVar<Failure, E>
    
    init(_ a: IOBoundVar<Failure, A>,
         _ b: IOBoundVar<Failure, B>,
         _ c: IOBoundVar<Failure, C>,
         _ d: IOBoundVar<Failure, D>,
         _ e: IOBoundVar<Failure, E>) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
    }
    
    override func bind(_ value: (A, B, C, D, E)) {
        self.a.bind(value.0)
        self.b.bind(value.1)
        self.c.bind(value.2)
        self.d.bind(value.3)
        self.e.bind(value.4)
    }
}

internal class IOBoundVar6<Failure: Error, A, B, C, D, E, F>: IOBoundVar<Failure, (A, B, C, D, E, F)> {
    let a: IOBoundVar<Failure, A>
    let b: IOBoundVar<Failure, B>
    let c: IOBoundVar<Failure, C>
    let d: IOBoundVar<Failure, D>
    let e: IOBoundVar<Failure, E>
    let f: IOBoundVar<Failure, F>
    
    init(_ a: IOBoundVar<Failure, A>,
         _ b: IOBoundVar<Failure, B>,
         _ c: IOBoundVar<Failure, C>,
         _ d: IOBoundVar<Failure, D>,
         _ e: IOBoundVar<Failure, E>,
         _ f: IOBoundVar<Failure, F>) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f
    }
    
    override func bind(_ value: (A, B, C, D, E, F)) {
        self.a.bind(value.0)
        self.b.bind(value.1)
        self.c.bind(value.2)
        self.d.bind(value.3)
        self.e.bind(value.4)
        self.f.bind(value.5)
    }
}

internal class IOBoundVar7<Failure: Error, A, B, C, D, E, F, G>: IOBoundVar<Failure, (A, B, C, D, E, F, G)> {
    let a: IOBoundVar<Failure, A>
    let b: IOBoundVar<Failure, B>
    let c: IOBoundVar<Failure, C>
    let d: IOBoundVar<Failure, D>
    let e: IOBoundVar<Failure, E>
    let f: IOBoundVar<Failure, F>
    let g: IOBoundVar<Failure, G>
    
    init(_ a: IOBoundVar<Failure, A>,
         _ b: IOBoundVar<Failure, B>,
         _ c: IOBoundVar<Failure, C>,
         _ d: IOBoundVar<Failure, D>,
         _ e: IOBoundVar<Failure, E>,
         _ f: IOBoundVar<Failure, F>,
         _ g: IOBoundVar<Failure, G>) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f
        self.g = g
    }
    
    override func bind(_ value: (A, B, C, D, E, F, G)) {
        self.a.bind(value.0)
        self.b.bind(value.1)
        self.c.bind(value.2)
        self.d.bind(value.3)
        self.e.bind(value.4)
        self.f.bind(value.5)
        self.g.bind(value.6)
    }
}

internal class IOBoundVar8<Failure: Error, A, B, C, D, E, F, G, H>: IOBoundVar<Failure, (A, B, C, D, E, F, G, H)> {
    let a: IOBoundVar<Failure, A>
    let b: IOBoundVar<Failure, B>
    let c: IOBoundVar<Failure, C>
    let d: IOBoundVar<Failure, D>
    let e: IOBoundVar<Failure, E>
    let f: IOBoundVar<Failure, F>
    let g: IOBoundVar<Failure, G>
    let h: IOBoundVar<Failure, H>
    
    init(_ a: IOBoundVar<Failure, A>,
         _ b: IOBoundVar<Failure, B>,
         _ c: IOBoundVar<Failure, C>,
         _ d: IOBoundVar<Failure, D>,
         _ e: IOBoundVar<Failure, E>,
         _ f: IOBoundVar<Failure, F>,
         _ g: IOBoundVar<Failure, G>,
         _ h: IOBoundVar<Failure, H>) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f
        self.g = g
        self.h = h
    }
    
    override func bind(_ value: (A, B, C, D, E, F, G, H)) {
        self.a.bind(value.0)
        self.b.bind(value.1)
        self.c.bind(value.2)
        self.d.bind(value.3)
        self.e.bind(value.4)
        self.f.bind(value.5)
        self.g.bind(value.6)
        self.h.bind(value.7)
    }
}

internal class IOBoundVar9<Failure: Error, A, B, C, D, E, F, G, H, I>: IOBoundVar<Failure, (A, B, C, D, E, F, G, H, I)> {
    let a: IOBoundVar<Failure, A>
    let b: IOBoundVar<Failure, B>
    let c: IOBoundVar<Failure, C>
    let d: IOBoundVar<Failure, D>
    let e: IOBoundVar<Failure, E>
    let f: IOBoundVar<Failure, F>
    let g: IOBoundVar<Failure, G>
    let h: IOBoundVar<Failure, H>
    let i: IOBoundVar<Failure, I>
    
    init(_ a: IOBoundVar<Failure, A>,
         _ b: IOBoundVar<Failure, B>,
         _ c: IOBoundVar<Failure, C>,
         _ d: IOBoundVar<Failure, D>,
         _ e: IOBoundVar<Failure, E>,
         _ f: IOBoundVar<Failure, F>,
         _ g: IOBoundVar<Failure, G>,
         _ h: IOBoundVar<Failure, H>,
         _ i: IOBoundVar<Failure, I>) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f
        self.g = g
        self.h = h
        self.i = i
    }
    
    override func bind(_ value: (A, B, C, D, E, F, G, H, I)) {
        self.a.bind(value.0)
        self.b.bind(value.1)
        self.c.bind(value.2)
        self.d.bind(value.3)
        self.e.bind(value.4)
        self.f.bind(value.5)
        self.g.bind(value.6)
        self.h.bind(value.7)
        self.i.bind(value.8)
    }
}

internal class IOBoundVar10<Failure: Error, A, B, C, D, E, F, G, H, I, J>: IOBoundVar<Failure, (A, B, C, D, E, F, G, H, I, J)> {
    let a: IOBoundVar<Failure, A>
    let b: IOBoundVar<Failure, B>
    let c: IOBoundVar<Failure, C>
    let d: IOBoundVar<Failure, D>
    let e: IOBoundVar<Failure, E>
    let f: IOBoundVar<Failure, F>
    let g: IOBoundVar<Failure, G>
    let h: IOBoundVar<Failure, H>
    let i: IOBoundVar<Failure, I>
    let j: IOBoundVar<Failure, J>
    
    init(_ a: IOBoundVar<Failure, A>,
         _ b: IOBoundVar<Failure, B>,
         _ c: IOBoundVar<Failure, C>,
         _ d: IOBoundVar<Failure, D>,
         _ e: IOBoundVar<Failure, E>,
         _ f: IOBoundVar<Failure, F>,
         _ g: IOBoundVar<Failure, G>,
         _ h: IOBoundVar<Failure, H>,
         _ i: IOBoundVar<Failure, I>,
         _ j: IOBoundVar<Failure, J>) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f
        self.g = g
        self.h = h
        self.i = i
        self.j = j
    }
    
    override func bind(_ value: (A, B, C, D, E, F, G, H, I, J)) {
        self.a.bind(value.0)
        self.b.bind(value.1)
        self.c.bind(value.2)
        self.d.bind(value.3)
        self.e.bind(value.4)
        self.f.bind(value.5)
        self.g.bind(value.6)
        self.h.bind(value.7)
        self.i.bind(value.8)
        self.j.bind(value.9)
    }
}
