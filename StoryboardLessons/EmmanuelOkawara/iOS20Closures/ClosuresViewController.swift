//
//  ClosuresViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 2/7/23.
//

import UIKit

class ClosuresViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let funcs = [
            "add": add,
            "sub": sub
        ]
        
        let addFunc = funcs["add"]!
        print(addFunc(1, 2))
        
        let subFunc = funcs["sub"]!
        print(subFunc(5, 3))
        
        let result: () = opera(num1: 10, num2: 11) { addition, subtraction in
            print("The addition is: \(addition)")
            print("The subtraction is: \(subtraction)")
        }
        
        print(result)
        
        let game1 = game()
        print(game1())
        print(game1())
        
        let game2 = game()
        print(game2())
    }
    
    let add: (Int, Int) -> Int = {
        return $0 + $1
    }
    
    let sub: (Int, Int) -> Int = {
        return $0 - $1
    }
    
    func opera(num1: Int, num2: Int, result: (Int, Int) -> Void) {
        let add = num1 + num2
        let sub = num1 - num2
        result(add, sub)
    }
    
    func game() -> () -> Int {
        var multiplier = 0
        
        let increase = { () -> Int in
            multiplier += 1
            return multiplier
        }
        
        return increase
    }
}
