//
//  SwiftBasics.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 7/19/23.
//

import Foundation

class SwiftBasics {

    static func getData() -> String {
        // Actions that happen at the end of function execution
        defer {
            print("Complete")
        }
        
        return "Data"
    }
    
//    var textColor: Color {
//      switch colorScheme {
//        case .light: return .white
//        case .dark: return .black
//        @unknown default: return .red
//      }
//    }
            
    enum ArithmeticExpression {
        case number(Int)
        indirect case addition(ArithmeticExpression, ArithmeticExpression)
        indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
    }
    
    func enumerations() {
        enum CompassPoint {
            case north, south, east, west
            mutating func turnNorth() {
                self = .north
            }
        }
        var currentDirection = CompassPoint.west
        let rememberedDirection = currentDirection
        currentDirection.turnNorth()
        
        // print(currentDirection) Prints "north"
        // print(rememberedDirection) Prints "west"
    }
    
    func structProperties() {
        struct FixedLengthRange {
            var firstValue: Int
            let length: Int
        }
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        // the range represents integer values 0, 1, and 2
        rangeOfThreeItems.firstValue = 6
        // the range now represents integer values 6, 7, and 8
        
        let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
        // this range represents integer values 0, 1, 2, and 3
//        rangeOfFourItems.firstValue = 6
        // this will report an error, even though firstValue is a variable property
    }
        
    @propertyWrapper
    struct SmallNumber {
        private var maximum: Int
        private var number: Int

        var wrappedValue: Int {
            get { return number }
            set { number = min(newValue, maximum) }
        }


        init() {
            maximum = 12
            number = 0
        }
        init(wrappedValue: Int) {
            maximum = 12
            number = min(wrappedValue, maximum)
        }
        init(wrappedValue: Int, maximum: Int) {
            self.maximum = maximum
            number = min(wrappedValue, maximum)
        }
    }
    struct NarrowRectangle {
        @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
        @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
    }

    struct Matrix {
        let rows: Int, columns: Int
        var grid: [Double]
        init(rows: Int, columns: Int) {
            self.rows = rows
            self.columns = columns
            grid = Array(repeating: 0.0, count: rows * columns)
        }
        func indexIsValid(row: Int, column: Int) -> Bool {
            return row >= 0 && row < rows && column >= 0 && column < columns
        }
        subscript(row: Int, column: Int) -> Double {
            get {
                assert(indexIsValid(row: row, column: column), "Index out of range")
                return grid[(row * columns) + column]
            }
            set {
                assert(indexIsValid(row: row, column: column), "Index out of range")
                grid[(row * columns) + column] = newValue
            }
        }
    }

    class Vehicle {
        var wheels: Int
        // Rule 1: A designated initializer must call a designated initializer from its immediate superclass.
        // As Vehicle is the base class, it has only designated initializers.
        init(wheels: Int) {
            self.wheels = wheels
        }
    }
    // Subclass
    class Car: Vehicle {
        var color: String
        // Rule 1: A designated initializer must call a designated initializer from its immediate superclass.
        // This designated initializer calls the superclass's designated initializer.
        init(wheels: Int, color: String) {
            self.color = color
            super.init(wheels: wheels)
        }
        // Rule 2: A convenience initializer must call another initializer from the same class.
        // Rule 3: A convenience initializer must ultimately call a designated initializer.
        // This convenience initializer calls the class's designated initializer, satisfying both rules.
        convenience init(color: String) {
            self.init(wheels: 4, color: color)
        }
        
        //Can also override convenience inits
        override init(wheels: Int) {
            self.color = "Red" // Assign a default color
            super.init(wheels: wheels)
        }
    }

    class CartItem {
        let quantity: Int
        init?(name: String, quantity: Int) {
            if quantity < 1 { return nil }
            self.quantity = quantity
        }
    }

}
