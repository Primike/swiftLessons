//
//  SwiftDouble.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 3/11/24.
//

import Foundation

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
