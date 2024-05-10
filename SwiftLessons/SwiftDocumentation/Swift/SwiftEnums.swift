//
//  SwiftEnums.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/8/24.
//

import Foundation

class SwiftEnums {
    
    // enum associated values
    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }
    
    static let productBarcode = Barcode.upc(8, 85909, 51226, 3)

    
    
    // implicitly set the next cases values 2,3,4...
    enum Planet: Int {
        case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    }

    static let possiblePlanet = Planet(rawValue: 7) ?? .earth

    // implicitly set the values as the case names
    // mutating changes the assigned variables case instance
    enum CompassPoint: String {
        case north, south, east, west
        
        mutating func turnNorth() {
            self = .north
        }
    }

    
    
    // allows enum recursion
    enum ArithmeticExpression {
        case number(Int)
        indirect case addition(ArithmeticExpression, ArithmeticExpression)
        indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
    }
    
    
    
    // User unknown for external enums
    static func unknownCase(_ point: CompassPoint) -> String {
        switch point {
        case .east:
            return "East"
        case .north:
            return "North"
        case .south:
            return "South"
        case .west:
            return "West"
        @unknown default:
            return "Unknown"
        }
    }
}
