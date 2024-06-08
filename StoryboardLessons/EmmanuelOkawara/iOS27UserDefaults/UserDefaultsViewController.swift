//
//  UserDefaultsViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 3/17/23.
//

import UIKit

class UserDefaultsViewController: UIViewController {

    @IBOutlet weak var switchView: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let isOn = UserDefaults.standard.switchIsOn
        updateBackground(isOn: isOn)
        
        let user = UDUser(firstName: "Big", lastName: "Chungus")
//        UserDefaults.standard.signedInUser = user
        
        print("The signed in user is: \(UserDefaults.standard.signedInUser)")
        
//        UserDefaultsManager.shared.signedInUser = user
    }
    

    @IBAction func switchToggled(_ sender: UISwitch) {
        updateBackground(isOn: sender.isOn)
        
        UserDefaults.standard.switchIsOn = sender.isOn
    }
    
    private func updateBackground(isOn: Bool) {
        view.backgroundColor = isOn ? .orange : .darkGray
        switchView.isOn = isOn
    }
}
