//
//  Objects.swift
//  MemoryLeaksPrevention
//
//  Created by Fabio Nisci on 14/05/22.
//

import Foundation

//class prone to leak
class ClassLeaked{
    var b: ClassWithRetainCycle?
    init(){
        self.b = ClassWithRetainCycle(a: self)
    }
}

// class to cause the leak
class ClassWithRetainCycle{
    var a: ClassLeaked //strong reference, will cause the leak
    
    init(a: ClassLeaked) {
        self.a = a
    }
}

//class deallocable
class ClassUnLeaked{
    var b: ClassWithoutRetainCycle?
    init(){
        self.b = ClassWithoutRetainCycle(a: self)
    }
}

//class preventing the leak
class ClassWithoutRetainCycle{
    weak var a: ClassUnLeaked? //weak reference, will break the cycle
    
    init(a: ClassUnLeaked) {
        self.a = a
    }
}
