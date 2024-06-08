//
//  SwiftMemorySafety.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/17/24.
//

import Foundation

class SwiftMemorySafety {
    
    /*
     1. Avoid Simultaneous Reads and Writes to the Same Memory Location (same line)
     2. Avoid Passing the Same Variable Twice as inout Parameters
     3. Exclusive Access to Struct Properties:
     4. Ensure concurrency safety for inout/mutating parameters
     */
    
    // #1 Not instantaneous Leads to undefined behavior
    static func error() {
        var stepSize = 1
        
        func increment(_ number: inout Int) {
            number += stepSize
        }
        
        increment(&stepSize)
    }
    
    
    
    static func balance(_ x: inout Int, _ y: inout Int) {
        let sum = x + y
        x = sum / 2
        y = sum - x
    }
    
    // in-out parameters are designed to have exclusive access to the variable they modify
    static func error2() {
        var playerOneScore = 42
        var playerTwoScore = 30
        balance(&playerOneScore, &playerTwoScore)
        
        // Produces an error #2
        //        balance(&playerOneScore, &playerOneScore)
    }
    
    
    
    // Compiler requires the funciton to have exclusive access to code
    // First create a copy to grant exclusive access to only the inside of the func
    struct Player {
        var name: String
        var health: Int
        var energy: Int
        
        mutating func balanceHealthAndEnergy() {
            //            balance(&health, &energy)  // This will cause an error
            
            // This works creating a copy #3
            var player = self
            balance(&player.health, &player.energy)
            
            health = player.health
            energy = player.energy
        }
    }
}
