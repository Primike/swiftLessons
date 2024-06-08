//
//  TypeAlias.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 3/16/23.
//

import Foundation

typealias Integer = Int

let num1: Integer = 1
let num2: Int = 10



typealias Parameter = [String: Any]

let user: Parameter = [
    "name": "Prince",
    "gender": "male"
]



typealias NameType = (String, String) -> String

let names: NameType = { first, last in
    return "\(first) \(last)"
}



protocol ProtocolA {
    func printA()
}

protocol ProtocolB {
    func printB()
}

typealias MyProtocols = ProtocolA & ProtocolB

class Macco: MyProtocols {
    func printA() {
        
    }
    
    func printB() {
        
    }
}
