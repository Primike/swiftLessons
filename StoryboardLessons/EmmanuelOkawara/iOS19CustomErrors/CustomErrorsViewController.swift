//
//  CustomErrorsViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 2/6/23.
//

import UIKit

class CustomErrorsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        isValidForm(email: "test@chungus.com", phone: "11111111111", name: "Big Chungus")
    }
    
    func isValidEmail(_ email: String) throws {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        if !emailPred.evaluate(with: email) {
            throw ChungusError.invalidEmail(email)
        }
    }
    
    func isValidPhone(_ phone: String) throws {
        if !(phone.count == 11) {
            throw ChungusError.invalidPhone
        }
    }
    
    func isValidName(_ name: String) throws {
        let words = name.components(separatedBy: .whitespaces)
        if words.count < 2 {
            throw ChungusError.invalidName
        }
    }
    
    func isValidForm(email: String, phone: String, name: String) {
        do {
            try isValidEmail(email)
            try isValidPhone(phone)
            try isValidName(name)
            print("Everything is correct")
        } catch ChungusError.invalidName {
            print("You cant fool big chungus")
        } catch {
            print(error.localizedDescription)

        }
    }
}

