//
//  SwiftARC.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/17/24.
//

import Foundation

class SwiftARC {
    
    // Unowned requires Customer to never deinit while CreditCard is in memory
    // Weak doesnt not require Customer to stay in memory
    class Customer {
        let name: String
        var card: CreditCard?
        
        init(name: String) {
            self.name = name
        }
    }
    class CreditCard {
        let number: UInt64
        unowned let customer: Customer
        weak var optionalCustomer: Customer?
        
        init(number: UInt64, customer: Customer) {
            self.number = number
            self.customer = customer
        }
    }
    
    class Department {
        var name: String
        var courses: [Course]
        init(name: String) {
            self.name = name
            self.courses = []
        }
    }
    
    
    class Course {
        var name: String
        unowned var department: Department
        unowned var nextCourse: Course?
        init(name: String, in department: Department) {
            self.name = name
            self.department = department
            self.nextCourse = nil
        }
    }
    
    
    
    // Closures are reference types so it can cause a memory leak
    class HTMLElement {
        
        let name: String
        let text: String?
        
        lazy var asHTML: () -> String = {
            [unowned self] in
            if let text = self.text {
                return "<\(self.name)>\(text)</\(self.name)>"
            } else {
                return "<\(self.name) />"
            }
        }
        
        init(name: String, text: String? = nil) {
            self.name = name
            self.text = text
        }
        
        deinit {
            print("\(name) is being deinitialized")
        }
    }
}
