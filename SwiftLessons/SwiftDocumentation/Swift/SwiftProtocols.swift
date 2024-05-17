//
//  SwiftProtocols.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/13/24.
//

import Foundation

class SwiftProtocols {
    
    protocol Togglable {
        mutating func toggle()
    }

    enum OnOffSwitch: Togglable {
        case off, on
        mutating func toggle() {
            switch self {
            case .off:
                self = .on
            case .on:
                self = .off
            }
        }
    }


    
    // For classes only
    protocol SomeProtocol: AnyObject {
        init()
    }
    class SomeSuperClass {
        init() {
        }
    }
    
    class SomeSubClass: SomeSuperClass, SomeProtocol {
        // "required" from SomeProtocol conformance; "override" from SomeSuperClass
        required override init() {
        }
    }
    
    
    
}

// Conditionally conforming to protocol for elements that are TextRepresentable
//extension Array: TextRepresentable where Element: TextRepresentable {
//    var textualDescription: String {
//        let itemsAsText = self.map { $0.textualDescription }
//        return "[" + itemsAsText.joined(separator: ", ") + "]"
//    }
//}
