//
//  SwiftInt.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 3/11/24.
//

import Foundation

class SwiftInt {
    
    // Different init based on input type
    static let integer: Int = Int(7)
    static let possibleInt: Int? = Int(exactly: 0.9)
    
    // Static funcs
    static let isEqual: Bool = (==)(3, 4)
    static let addition: Int = (+)(3, 4)
    
    static let identity: Int = 7 + .zero
    
    static let boundedByBottom: PartialRangeFrom<Int> = 7...
    static let boundedByTop: PartialRangeThrough<Int> = ...7
    
}

// also postfix
prefix operator ~~!

// let x = 1 ~~! 2
extension Int {
    static prefix func ~~!(number: inout Int) -> Int {
        number += 1
        return number
    }
}
