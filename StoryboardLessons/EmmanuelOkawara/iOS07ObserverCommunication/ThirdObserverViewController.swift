//
//  ThirdObserverViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 1/29/23.
//

import UIKit

class ThirdObserverViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!

    @IBAction func saveButtonClicked(_ sender: UIButton) {
        NotificationCenter.default.post(name: .myNotification, object: nil, userInfo: ["name": nameField.text ?? ""])
    }
    
}

extension NSNotification.Name {
    static let myNotification = NSNotification.Name("Prince")
}
