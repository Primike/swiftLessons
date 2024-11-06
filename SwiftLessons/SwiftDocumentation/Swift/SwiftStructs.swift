//
//  SwiftStructs.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/9/24.
//

import Foundation

class SwiftStructs {
    
    // changing 'let range: FixedLengthRange' properties is an error
    // becuase range is a constant and structs are value types
    struct FixedLengthRange {
        var firstValue: Int
        let length: Int
    }

    
    
    // volume shorthand way for get/read only
    struct Cuboid {
        var width = 0.0, height = 0.0, depth = 0.0
        var volume: Double {
            return width * height * depth
        }
    }

    
    
    // needs 1 variable of any type named wrappedValue
    // @SmallNumber only directly exposes the wrappedValue
    // for other properties use _number.isEqualToMaximum()
    // projectedValue accessed with $number
    @propertyWrapper
    struct SmallNumber {
        private var maximum: Int
        private var number: Int
        private(set) var projectedValue: Bool

        var wrappedValue: Int {
            get { return number }
            set { number = min(newValue, maximum) }
        }

        init() {
            maximum = 12
            number = 0
            projectedValue = false
        }
        
        init(wrappedValue: Int) {
            maximum = 12
            number = min(wrappedValue, maximum)
            projectedValue = false
        }
        
        init(wrappedValue: Int, maximum: Int) {
            self.maximum = maximum
            number = min(wrappedValue, maximum)
            projectedValue = false
        }
        
        func isEqualToMaximum() -> Bool {
            return number == maximum
        }
    }
    
    struct RectangularPrism {
        @SmallNumber var length: Int
        @SmallNumber(wrappedValue: 2) var height: Int
        @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
    }

    // another way to use this struct, adding more functionality
    // underscored is for internal use
    struct SmallRectangle {
        private var _height = SmallNumber()
        private var _width = SmallNumber()
        
        var height: Int {
            get { return _height.wrappedValue }
            set { _height.wrappedValue = newValue }
        }
        
        var width: Int {
            get { return _width.wrappedValue }
            set { _width.wrappedValue = newValue }
        }
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
    
    
    
    // mutating can change properties or create a new instance
    struct Point {
        var x = 0.0, y = 0.0
        
        mutating func moveBy(x deltaX: Double, y deltaY: Double) {
            x += deltaX
            y += deltaY
            self = Point(x: x + deltaX, y: y + deltaY)
        }
    }

    struct Size {
        var width = 0.0, height = 0.0
    }

    // structs dont differentiate between convenience and designated inits
    // any init can call any other init
    struct Rect {
        var origin = Point()
        var size = Size()
        
        init() {}
        
        init(origin: Point, size: Size) {
            self.init()
            self.origin = origin
            self.size = size
        }
        
        init(center: Point, size: Size) {
            let originX = center.x - (size.width / 2)
            let originY = center.y - (size.height / 2)
            self.init(origin: Point(x: originX, y: originY), size: size)
        }
    }
}
