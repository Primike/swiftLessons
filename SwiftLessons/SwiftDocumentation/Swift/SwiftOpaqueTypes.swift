//
//  SwiftOpaqueTypes.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/15/24.
//

import Foundation

class SwiftOpaqueTypes {
    
    protocol Shape {
        func draw() -> String
    }

    struct Triangle: Shape {
        var size: Int
        func draw() -> String {
           var result: [String] = []
           for length in 1...size {
               result.append(String(repeating: "*", count: length))
           }
           return result.joined(separator: "\n")
        }
    }
    
    // One way to transform a Shape type user calls on these Structs
    struct FlippedShape<T: Shape>: Shape {
        var shape: T
        func draw() -> String {
            let lines = shape.draw().split(separator: "\n")
            return lines.reversed().joined(separator: "\n")
        }
    }
    struct JoinedShape<T: Shape, U: Shape>: Shape {
        var top: T
        var bottom: U
        func draw() -> String {
           return top.draw() + "\n" + bottom.draw()
        }
    }
    static let smallTriangle = Triangle(size: 3)
    static let flippedTriangle = FlippedShape(shape: smallTriangle)

    // Opaque way to transform a Shape type, a function calls the Structs
    // Transformation Struct information is hidden by returning only Shape type
    static func flip<T: Shape>(_ shape: T) -> some Shape {
        return FlippedShape(shape: shape)
    }
    static func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
        JoinedShape(top: top, bottom: bottom)
    }

    /*
     Opaque types is preferred since if the code/api ever changes
     The user will be unaffected since the implementation details is hidden
     It is better to keep the modifier structs private
     */
    static func differentTypes() {
        let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
        let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
    }
    
    
    // With some this function must choose only 1 Type to return that conforms to Shape
    // Removing some allows this func to return any Type conforming to shape
    // This allows multiple if statments to return different types conforming to Shape
    static func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
//        if shape is Triangle { return shape }
        
        return FlippedShape(shape: shape)
    }
    
    static let shape: some Shape = invalidFlip(Triangle(size: 2))
    
    
    
    // Boxed protocol type / Existential protocol type
    static let shapes: [Shape] = [Triangle(size: 3), FlippedShape(shape: Triangle(size: 2))]
}
