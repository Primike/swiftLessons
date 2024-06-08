//
//  IBOutletViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 1/29/23.
//

import UIKit

class IBOutletViewController: UIViewController {

    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func submitButtonClicked(_ sender: UIButton) {
        let name = nameField.text ?? ""
        
        headerLabel.text = "Welcome, \(name)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameField.resignFirstResponder()
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            self.view.backgroundColor = .white
        } else {
            self.view.backgroundColor = .lightGray
        }

    }
}
