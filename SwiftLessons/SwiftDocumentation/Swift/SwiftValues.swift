//
//  SwiftValues.swift
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


class SwiftDouble {
    
    static let possibleDouble: Double? = Double("string")
    static let squareRoot: Double = 4.0.squareRoot()
    
    /// Determines if two `Double` values are equal.
    @inlinable
    static func isEqual(_ a: Double, _ b: Double) -> Bool {
        return (==)(a, b)
    }

    static let addition: Double = (+)(3.0, 4.0)
    
    static let boundedByBottom: PartialRangeFrom<Double> = 7.0...
    static let boundedByTop: PartialRangeThrough<Double> = ...7.0
    
    static let remainder: Double = 0.75.remainder(dividingBy: 0.75)
    static let largest: Double = Double.maximumMagnitude(1.5, -2.0)
    
    static let description: String = 1.5.description
}

class SwiftString {
    
    static let string: String = "String"
    static let shuffled = ["a", "b", "c"].shuffled()
    
    // Constant time
    static let prefixString: Substring = "String".prefix(2)
    static let reverse: ReversedCollection<String> = "String".reversed()
    static let letters: [Character] = ["a", "b", "c"]
    static let characters: String = String(letters)
    
    // mutating
    static let newString = string.appending("New")
    
    // protocol
    static let stringProtocol: any StringProtocol = "String Protocol"
    static let stringTypeCast: String = stringProtocol as! String
}

// Dicts: UnorderedCollection, keys must be Hashable
