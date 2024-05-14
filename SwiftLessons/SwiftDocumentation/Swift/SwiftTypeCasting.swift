//
//  SwiftTypeCasting.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/13/24.
//

import Foundation

class SwiftTypeCasting {
    
    static func typeCast() {
        var things: [Any] = []

        things.append(0)
        things.append(0.0)
        things.append(42)
        things.append(3.14159)
        things.append("hello")
        things.append((3.0, 5.0))
        things.append({ (name: String) -> String in "Hello, \(name)" })

        for thing in things {
            switch thing {
            case 0 as Int:
                print("zero as an Int")
            case 0 as Double:
                print("zero as a Double")
            case let someInt as Int:
                print("an integer value of \(someInt)")
            case let someDouble as Double where someDouble > 0:
                print("a positive double value of \(someDouble)")
            case is Double:
                print("some other double value that I don't want to print")
            case let someString as String:
                print("a string value of \"\(someString)\"")
            case let (x, y) as (Double, Double):
                print("an (x, y) point at \(x), \(y)")
            case let stringConverter as (String) -> String:
                print(stringConverter("Michael"))
            default:
                print("something else")
            }
        }
    }
}
