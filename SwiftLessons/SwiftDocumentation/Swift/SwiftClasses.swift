//
//  SwiftClasses.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 7/19/23.
//

import Foundation

class SwiftClasses {

    // overriding, super and final(cannot be overridden)
    // classes without an init recieve a default init() {}
    class Liquid {
        final let matterType: String = "Liquid"
        
        var description: String {
            return "This is a liquid"
        }
    }
    
    class Water: Liquid {
        var volume: Int = 5
        
        override var description: String {
            return super.description + "called water"
        }
    }
    
    class Soda: Water {
        override var volume: Int {
            didSet {
                print("Set new volume")
            }
        }
    }

    
    
    // A designated init must call a designated init from its superclass.
    // Convenience inits must call other inits in the class ending in designated init
    // Only a convenience init can call a designated init
    class Vehicle {
        var wheels: Int
        
        init(wheels: Int) {
            self.wheels = wheels
        }
    }
    
    class Car: Vehicle {
        var color: String

        init(wheels: Int, color: String) {
            self.color = color
            super.init(wheels: wheels)
        }
        
        convenience init(color: String) {
            self.init(wheels: 4, color: color)
        }
        
        override init(wheels: Int) {
            self.color = "Red" // Assign a default color
            super.init(wheels: wheels)
        }
    }

    
    
    /*
     Rule 1:
     A designated initializer must ensure that all of the properties
     are initialized before it delegates up to a superclass initializer.

     Rule 2:
     A designated initializer must delegate up to a superclass initializer before assigning
     a value to an inherited property. If it doesn’t, the new value will be overwritten
     by the superclass as part of its own initialization.
     
     Rule 3:
     A convenience initializer must delegate to another initializer before assigning
     a value to any property. If it doesn’t, the new value the convenience initializer assigns
     will be overwritten by its own class’s designated initializer.
     
     Rule 4:
     An initializer can’t call any instance methods, read the values of any instance properties, 
     or refer to self as a value until after the first phase of initialization is complete.
     */
    class Parent {
        var number: Int
        
        init(number: Int) {
            self.number = number
        }
    }
    class Child: Parent {
        var description: String

        // Rule 1, 2
        init(description: String, number: Int) {
            self.description = description
            super.init(number: number)
            self.number = 7
        }
        
        // Rule 2, 4
        convenience init(description: String) {
            self.init(description: description, number: 1)
            afterInit()
        }
        
        func afterInit() {
            print("Value after init: \(self.description)")
        }
    }

    
    /*
     Swift subcases dont always inherit superclass inits
     
     You always write the override modifier when overriding a superclass designated initializer,
     even if your subclass’s implementation of the initializer is a convenience initializer.
     
     override is not needed for a superclasses convenience init since it can never be called
     
     if a class has no inits it inherits all its superclasses designated inits
     if a class overrides all superclasses designated inits it inherits all superclasses convenience init
     */
    
    
    
    class CartItem {
        
        // customized init for string. This closure is called once when the class inits
        var customSetup: String = {
            var newString = ""
            newString += "Custom"
            return newString
        }()
        
        let quantity: Int

        // failable init, these can be overriden by subclasses
        init?(name: String, quantity: Int) {
            if quantity < 1 { return nil }
            self.quantity = quantity
        }
        
        // required means every subclass must implement this init. Prefixed with required not override
        required init(_ quantity: Int) {
            self.quantity = quantity
        }
    }
}
