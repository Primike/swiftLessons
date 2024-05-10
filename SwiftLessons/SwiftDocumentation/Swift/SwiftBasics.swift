//
//  SwiftBasics.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 7/19/23.
//

import Foundation

class SwiftBasics {
    

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
