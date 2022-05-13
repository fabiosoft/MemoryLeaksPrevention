//
//  ViewController.swift
//  MemoryLeaksPrevention
//
//  Created by Fabio Nisci on 13/05/22.
//

import UIKit

class ViewControllerUnleaked: UIViewController {
    var a = 10
    var b = 30
    var someClosure: (() -> Int)?
    
    override func viewDidLoad() {
        someClosure = { [weak self] in
            /// Leak Solution:
            /// closure now capturing a weak reference to self. since we are using weak which makes self as optional that’s why we use a guard to safe unwrap the value of self
            guard let `self` = self else { return 0 }
            return self.a + self.b
        }
        someMethod(closure: someClosure!)
    }
    
    func someMethod(closure: @escaping () -> Int){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            print(closure())
        }
    }
    
    deinit {
        print("i will be called, and the viewcontroller deallocated")
    }

}

class ViewControllerLeaked: UIViewController {
    var a = 10
    var b = 30
    var someClosure: (() -> Int)?
    
    override func viewDidLoad() {
        /// Closure needs a and b properties to execute it.
        /// Also since a and b are the properties of a class it will have to capture class reference as well by capturing self.
        someClosure = {
            return self.a + self.b
        }
        someMethod(closure: someClosure!)
    }
    
    func someMethod(closure: @escaping () -> Int){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            print(closure())
        }
    }
    
    deinit {
        print("i will never be called, leak!")
    }
}

