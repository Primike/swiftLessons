//
//  SwiftFunctions.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/5/24.
//

import Foundation

class SwiftFunctions {
    
    // Returns a function
    static func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        
        return addOne
    }

    static let eight = makeIncrementer()(7)
    
    // Takes in a function
    static func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) { return true }
        }
        
        return false
    }
    
    static func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
}
