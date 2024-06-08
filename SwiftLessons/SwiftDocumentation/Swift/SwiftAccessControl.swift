//
//  SwiftAccessControl.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/18/24.
//

import Foundation

class SwiftAccessControl {
    
    // open, public, internal, fileprivate, private
    // Default is internal for module if no access prefix
    // properties access only go up to the types access
    public class SomePublicClass {                  // explicitly public class
        public var somePublicProperty = 0            // explicitly public class member
        var someInternalProperty = 0                 // implicitly internal class member
        fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
        private func somePrivateMethod() {}          // explicitly private class member
    }
    
    
    
    // Allowed to call more restrictive super init with override
    public class A {
        fileprivate func someMethod() {}
    }
    internal class B: A {
        override internal func someMethod() {
            super.someMethod()
        }
    }
    
    
    
    // Default init is internal so to make this struct public init must be public
    public struct TrackedString {
        public private(set) var numberOfEdits = 0
        public var value: String = "" {
            didSet {
                numberOfEdits += 1
            }
        }
        public init() {}
    }
}
