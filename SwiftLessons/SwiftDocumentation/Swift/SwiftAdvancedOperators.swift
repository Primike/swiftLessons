//
//  SwiftAdvancedOperators.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/18/24.
//

import Foundation

// ???
// Declare prefixes for class
prefix operator +++
infix operator +-: AdditionPrecedence

class SwiftAdvancedOperators {
    
    struct Vector2D: Equatable {
        var x = 0.0, y = 0.0
        
        static func + (left: Vector2D, right: Vector2D) -> Vector2D {
            return Vector2D(x: left.x + right.x, y: left.y + right.y)
        }
        
        static prefix func - (vector: Vector2D) -> Vector2D {
            return Vector2D(x: -vector.x, y: -vector.y)
        }
        
        static func += (left: inout Vector2D, right: Vector2D) {
            left = left + right
        }
        
        // Equatable
        static func == (left: Vector2D, right: Vector2D) -> Bool {
            return (left.x == right.x) && (left.y == right.y)
        }
        
        static prefix func +++ (vector: inout Vector2D) -> Vector2D {
            vector += vector
            return vector
        }
        
        static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
            return Vector2D(x: left.x + right.x, y: left.y - right.y)
        }
    }
    
    static let combineTwo = Vector2D(x: 3.0, y: 1.0) + Vector2D(x: 4.0, y: 2.0)
    static let negative = -Vector2D(x: 3.0, y: 4.0)
    static let bool = Vector2D(x: 2.0, y: 3.0) == Vector2D(x: 2.0, y: 3.0)
    static var vector = Vector2D(x: 2.0, y: 3.0)
    static let doubled = +++vector
    static let plusMinus = Vector2D(x: 3.0, y: 1.0) +- Vector2D(x: 4.0, y: 2.0)
    
    
    
    protocol Drawable {
        func draw() -> String
    }
    struct Line: Drawable {
        var elements: [Drawable]
        func draw() -> String {
            return elements.map { $0.draw() }.joined(separator: "")
        }
    }
    struct Text: Drawable {
        var content: String
        init(_ content: String) { self.content = content }
        func draw() -> String { return content }
    }
    struct Space: Drawable {
        func draw() -> String { return " " }
    }
    struct Stars: Drawable {
        var length: Int
        func draw() -> String { return String(repeating: "*", count: length) }
    }
    struct AllCaps: Drawable {
        var content: Drawable
        func draw() -> String { return content.draw().uppercased() }
    }
    
    static let manualDrawing = Line(elements: [
        Stars(length: 3),
        Text("Hello"),
        Space(),
        AllCaps(content: Text("World")),
        Stars(length: 2),
    ])
    
    @resultBuilder
    struct DrawingBuilder {
        static func buildBlock(_ components: Drawable...) -> Drawable {
            return Line(elements: components)
        }
        static func buildEither(first: Drawable) -> Drawable {
            return first
        }
        static func buildEither(second: Drawable) -> Drawable {
            return second
        }
    }
    func draw(@DrawingBuilder content: () -> Drawable) -> Drawable {
        return content()
    }
    func caps(@DrawingBuilder content: () -> Drawable) -> Drawable {
        return AllCaps(content: content())
    }
    
    func makeGreeting(for name: String) -> Drawable {
        let greeting = draw {
            Stars(length: 3)
            Text("Hello")
            Space()
            caps {
                Text(name + "!")
            }
            Stars(length: 2)
        }
        return greeting
    }
}
