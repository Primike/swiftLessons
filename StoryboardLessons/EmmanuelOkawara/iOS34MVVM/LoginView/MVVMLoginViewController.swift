//
//  MVVMLoginViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 5/16/23.
//

import Foundation
import UIKit
import Combine

class MVVMLoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
//    private var cancellables: Set<AnyCancellable> = []
    private let viewModel = MVVMLoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBinders()
    }
    
    private func setupBinders() {
        viewModel.error.bind { [weak self] error in
            if let error = error {
                print(error)
            } else {
                self?.goToHomePage()
            }
        }
        
//        viewModel.$error.sink { [weak self] error in
//            if let error = error {
//                print(error)
//            } else {
//                self?.goToHomePage()
//            }
//        }.store(in: &cancellables)
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        guard let email = emailField.text, let password = passwordField.text else {
            print("Please enter email and password")
            return
        }
        
        viewModel.login(email: email, password: password)
    }
    
    private func goToHomePage() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "MVVMHomeViewController") as! MVVMHomeViewController
        
        present(controller, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
