//
//  SwiftClosures.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/7/24.
//

import Foundation

// closures capture references to variables in their outer context
// as opposed to functions
class SwiftClosures {
    
    // Pass in closure
    static let reversedNumbers = [1,2,3].sorted(by: { (s1: Int, s2: Int) -> Bool in
        return s1 > s2
    })

    
    static func loadPicture(from server: String?, completion: (String) -> Void, onFailure: () -> Void) {
        if let data = server {
            completion(data)
        } else {
            onFailure()
        }
    }

    
    // Returns a function
    static func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        
        return incrementer
    }
    // Original value inside closure can be modified
    // Something like a reference type to the value in incrementByTen
    static func returnForty() -> Int {
        let incrementByTen = makeIncrementer(forIncrement: 10)
        let _ = incrementByTen()
        let _ = incrementByTen()
        let _ = incrementByTen()
        return incrementByTen()
    }
    
    
    // closures passed in with class references/properties must be weak
    // [weak self] properties for @escaping and asynchronous code
    // structs cant call @escaping code
    static func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    
    // Auto creates a closure for a statement
    static func assert(_ condition: @autoclosure () -> Bool, message: String) -> String {
        if !condition() {
            return "\(message): \(condition())"
        }
        
        return "True"
    }

    static let message = assert(3 < 7, message: "Error")
}
