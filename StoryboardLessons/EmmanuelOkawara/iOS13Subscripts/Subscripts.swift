//
//  Subscripts.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 2/1/23.
//

import Foundation

struct Classroom {
    var students = [
        ["Eric", "Peter", "Quagmire", "Randy"],
        ["Messi", "Ronaldo", "Ronaldinho", "Xavi"],
        ["Trey", "Usher", "Nicki", "Alicia"],
        ["Mark", "Bill", "Elon", "Jeff"]
    ]
    
    subscript(row: Int, col: Int) -> String {
        get {
            return students[row][col]
        }
        
        set {
            students[row][col] = newValue
        }
    }
}
