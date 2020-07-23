public class EnvIOBoundVar<Dependencies, Failure: Error, Value> {
    private var value: Value? = nil
    
    public static func make() -> EnvIOBoundVar<Dependencies, Failure, Value> {
        EnvIOBoundVar()
    }
    
    internal init() {}
    
    internal func bind(_ value: Value) {
        self.value = value
    }
    
    public var get: Value {
        return value!
    }
    
    internal var erased: EnvIOBoundVar<Dependencies, Failure, Any> {
        EnvIOErasedBoundVar<Dependencies, Failure, Value>(self)
    }
}

private class EnvIOErasedBoundVar<Dependencies, Failure: Error, Value>: EnvIOBoundVar<Dependencies, Failure, Any> {
    private var boundVar: EnvIOBoundVar<Dependencies, Failure, Value>
    
    fileprivate init(_ boundVar: EnvIOBoundVar<Dependencies, Failure, Value>) {
        self.boundVar = boundVar
    }
    
    override func bind(_ value: Any) {
        boundVar.bind(value as! Value)
    }
}

internal class EnvIOBoundVar2<Dependencies, Failure: Error, A, B>: EnvIOBoundVar<Dependencies, Failure, (A, B)> {
    let a: EnvIOBoundVar<Dependencies, Failure, A>
    let b: EnvIOBoundVar<Dependencies, Failure, B>
    
    init(_ a: EnvIOBoundVar<Dependencies, Failure, A>,
         _ b: EnvIOBoundVar<Dependencies, Failure, B>) {
        self.a = a
        self.b = b
    }
    
    override func bind(_ value: (A, B)) {
        self.a.bind(value.0)
        self.b.bind(value.1)
    }
}

internal class EnvIOBoundVar3<Dependencies, Failure: Error, A, B, C>: EnvIOBoundVar<Dependencies, Failure, (A, B, C)> {
    let a: EnvIOBoundVar<Dependencies, Failure, A>
    let b: EnvIOBoundVar<Dependencies, Failure, B>
    let c: EnvIOBoundVar<Dependencies, Failure, C>
    
    init(_ a: EnvIOBoundVar<Dependencies, Failure, A>,
         _ b: EnvIOBoundVar<Dependencies, Failure, B>,
         _ c: EnvIOBoundVar<Dependencies, Failure, C>) {
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

internal class EnvIOBoundVar4<Dependencies, Failure: Error, A, B, C, D>: EnvIOBoundVar<Dependencies, Failure, (A, B, C, D)> {
    let a: EnvIOBoundVar<Dependencies, Failure, A>
    let b: EnvIOBoundVar<Dependencies, Failure, B>
    let c: EnvIOBoundVar<Dependencies, Failure, C>
    let d: EnvIOBoundVar<Dependencies, Failure, D>
    
    init(_ a: EnvIOBoundVar<Dependencies, Failure, A>,
         _ b: EnvIOBoundVar<Dependencies, Failure, B>,
         _ c: EnvIOBoundVar<Dependencies, Failure, C>,
         _ d: EnvIOBoundVar<Dependencies, Failure, D>) {
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

internal class EnvIOBoundVar5<Dependencies, Failure: Error, A, B, C, D, E>: EnvIOBoundVar<Dependencies, Failure, (A, B, C, D, E)> {
    let a: EnvIOBoundVar<Dependencies, Failure, A>
    let b: EnvIOBoundVar<Dependencies, Failure, B>
    let c: EnvIOBoundVar<Dependencies, Failure, C>
    let d: EnvIOBoundVar<Dependencies, Failure, D>
    let e: EnvIOBoundVar<Dependencies, Failure, E>
    
    init(_ a: EnvIOBoundVar<Dependencies, Failure, A>,
         _ b: EnvIOBoundVar<Dependencies, Failure, B>,
         _ c: EnvIOBoundVar<Dependencies, Failure, C>,
         _ d: EnvIOBoundVar<Dependencies, Failure, D>,
         _ e: EnvIOBoundVar<Dependencies, Failure, E>) {
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

internal class EnvIOBoundVar6<Dependencies, Failure: Error, A, B, C, D, E, F>: EnvIOBoundVar<Dependencies, Failure, (A, B, C, D, E, F)> {
    let a: EnvIOBoundVar<Dependencies, Failure, A>
    let b: EnvIOBoundVar<Dependencies, Failure, B>
    let c: EnvIOBoundVar<Dependencies, Failure, C>
    let d: EnvIOBoundVar<Dependencies, Failure, D>
    let e: EnvIOBoundVar<Dependencies, Failure, E>
    let f: EnvIOBoundVar<Dependencies, Failure, F>
    
    init(_ a: EnvIOBoundVar<Dependencies, Failure, A>,
         _ b: EnvIOBoundVar<Dependencies, Failure, B>,
         _ c: EnvIOBoundVar<Dependencies, Failure, C>,
         _ d: EnvIOBoundVar<Dependencies, Failure, D>,
         _ e: EnvIOBoundVar<Dependencies, Failure, E>,
         _ f: EnvIOBoundVar<Dependencies, Failure, F>) {
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

internal class EnvIOBoundVar7<Dependencies, Failure: Error, A, B, C, D, E, F, G>: EnvIOBoundVar<Dependencies, Failure, (A, B, C, D, E, F, G)> {
    let a: EnvIOBoundVar<Dependencies, Failure, A>
    let b: EnvIOBoundVar<Dependencies, Failure, B>
    let c: EnvIOBoundVar<Dependencies, Failure, C>
    let d: EnvIOBoundVar<Dependencies, Failure, D>
    let e: EnvIOBoundVar<Dependencies, Failure, E>
    let f: EnvIOBoundVar<Dependencies, Failure, F>
    let g: EnvIOBoundVar<Dependencies, Failure, G>
    
    init(_ a: EnvIOBoundVar<Dependencies, Failure, A>,
         _ b: EnvIOBoundVar<Dependencies, Failure, B>,
         _ c: EnvIOBoundVar<Dependencies, Failure, C>,
         _ d: EnvIOBoundVar<Dependencies, Failure, D>,
         _ e: EnvIOBoundVar<Dependencies, Failure, E>,
         _ f: EnvIOBoundVar<Dependencies, Failure, F>,
         _ g: EnvIOBoundVar<Dependencies, Failure, G>) {
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

internal class EnvIOBoundVar8<Dependencies, Failure: Error, A, B, C, D, E, F, G, H>: EnvIOBoundVar<Dependencies, Failure, (A, B, C, D, E, F, G, H)> {
    let a: EnvIOBoundVar<Dependencies, Failure, A>
    let b: EnvIOBoundVar<Dependencies, Failure, B>
    let c: EnvIOBoundVar<Dependencies, Failure, C>
    let d: EnvIOBoundVar<Dependencies, Failure, D>
    let e: EnvIOBoundVar<Dependencies, Failure, E>
    let f: EnvIOBoundVar<Dependencies, Failure, F>
    let g: EnvIOBoundVar<Dependencies, Failure, G>
    let h: EnvIOBoundVar<Dependencies, Failure, H>
    
    init(_ a: EnvIOBoundVar<Dependencies, Failure, A>,
         _ b: EnvIOBoundVar<Dependencies, Failure, B>,
         _ c: EnvIOBoundVar<Dependencies, Failure, C>,
         _ d: EnvIOBoundVar<Dependencies, Failure, D>,
         _ e: EnvIOBoundVar<Dependencies, Failure, E>,
         _ f: EnvIOBoundVar<Dependencies, Failure, F>,
         _ g: EnvIOBoundVar<Dependencies, Failure, G>,
         _ h: EnvIOBoundVar<Dependencies, Failure, H>) {
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

internal class EnvIOBoundVar9<Dependencies, Failure: Error, A, B, C, D, E, F, G, H, I>: EnvIOBoundVar<Dependencies, Failure, (A, B, C, D, E, F, G, H, I)> {
    let a: EnvIOBoundVar<Dependencies, Failure, A>
    let b: EnvIOBoundVar<Dependencies, Failure, B>
    let c: EnvIOBoundVar<Dependencies, Failure, C>
    let d: EnvIOBoundVar<Dependencies, Failure, D>
    let e: EnvIOBoundVar<Dependencies, Failure, E>
    let f: EnvIOBoundVar<Dependencies, Failure, F>
    let g: EnvIOBoundVar<Dependencies, Failure, G>
    let h: EnvIOBoundVar<Dependencies, Failure, H>
    let i: EnvIOBoundVar<Dependencies, Failure, I>
    
    init(_ a: EnvIOBoundVar<Dependencies, Failure, A>,
         _ b: EnvIOBoundVar<Dependencies, Failure, B>,
         _ c: EnvIOBoundVar<Dependencies, Failure, C>,
         _ d: EnvIOBoundVar<Dependencies, Failure, D>,
         _ e: EnvIOBoundVar<Dependencies, Failure, E>,
         _ f: EnvIOBoundVar<Dependencies, Failure, F>,
         _ g: EnvIOBoundVar<Dependencies, Failure, G>,
         _ h: EnvIOBoundVar<Dependencies, Failure, H>,
         _ i: EnvIOBoundVar<Dependencies, Failure, I>) {
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

internal class EnvIOBoundVar10<Dependencies, Failure: Error, A, B, C, D, E, F, G, H, I, J>: EnvIOBoundVar<Dependencies, Failure, (A, B, C, D, E, F, G, H, I, J)> {
    let a: EnvIOBoundVar<Dependencies, Failure, A>
    let b: EnvIOBoundVar<Dependencies, Failure, B>
    let c: EnvIOBoundVar<Dependencies, Failure, C>
    let d: EnvIOBoundVar<Dependencies, Failure, D>
    let e: EnvIOBoundVar<Dependencies, Failure, E>
    let f: EnvIOBoundVar<Dependencies, Failure, F>
    let g: EnvIOBoundVar<Dependencies, Failure, G>
    let h: EnvIOBoundVar<Dependencies, Failure, H>
    let i: EnvIOBoundVar<Dependencies, Failure, I>
    let j: EnvIOBoundVar<Dependencies, Failure, J>
    
    init(_ a: EnvIOBoundVar<Dependencies, Failure, A>,
         _ b: EnvIOBoundVar<Dependencies, Failure, B>,
         _ c: EnvIOBoundVar<Dependencies, Failure, C>,
         _ d: EnvIOBoundVar<Dependencies, Failure, D>,
         _ e: EnvIOBoundVar<Dependencies, Failure, E>,
         _ f: EnvIOBoundVar<Dependencies, Failure, F>,
         _ g: EnvIOBoundVar<Dependencies, Failure, G>,
         _ h: EnvIOBoundVar<Dependencies, Failure, H>,
         _ i: EnvIOBoundVar<Dependencies, Failure, I>,
         _ j: EnvIOBoundVar<Dependencies, Failure, J>) {
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
