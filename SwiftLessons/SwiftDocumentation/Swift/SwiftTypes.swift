//
//  SwiftTypes.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/19/24.
//

import Foundation

class SwiftTypes {
    
    // Type identifier
    typealias Point = (Int, Int)
    
    // Function type
    static let operation: (_ lhs: Int, _ rhs: Int) -> Int = { return $0 + $1 }
    
    
    
    // Different types of function declaration
    static let external: (() -> Void) -> Void = { _ in () }
    static let external2: (() -> Void) -> Void = { _ in }
    static let external3: (() -> Void) -> Void = { (closure: () -> Void) -> Void in
        closure()
    }
    static let external4: (() -> Void) -> Void = { closure in
        closure()
    }
    static let external5: (() -> Void) -> Void = { _ in
        return ()
    }
    
    
    
    // ???
    // non-escaping closure is being captured and passed to another non-escaping closure
    static func takesTwoFunctions(first: (() -> Void) -> Void, second: (() -> Void) -> Void) {
        //        first { first {} }
        //        second { second {}  }
        //        first { second {} }
        //        second { first {} }
        first { external {} }
        external { first {} }
    }
    
    
    
    // Self returns the class which could be a subclass
    class Superclass {
        func f() -> Self { return self }
    }
    
}
