//
//  MVCLoginViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 5/16/23.
//

import Foundation
import UIKit

class MVCLoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.addTarget(self, action: #selector(self.validateFields), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(self.validateFields), for: .editingChanged)

    }
    
    @objc private func validateFields() {
        loginButton.isEnabled = emailField.text != "" && passwordField.text != ""
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        MVCNetworkService.shared.login(email: emailField.text!, password: passwordField.text!) { success in
            if success {
                self.goToHomePage()
            } else {
                print("Invalid Credentials")
            }
        }
    }
    
    private func goToHomePage() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "MVCHomeViewController") as! MVCHomeViewController
        
        present(controller, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
