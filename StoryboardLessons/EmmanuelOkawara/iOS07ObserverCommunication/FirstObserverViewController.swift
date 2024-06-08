//
//  FirstObserverViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 1/29/23.
//

import UIKit

class FirstObserverViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    deinit {
        clearObserver()
    }

    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            self.view.backgroundColor = .green
            self.titleLabel.text = "Listening"
            setupObserver()
        } else {
            self.view.backgroundColor = .darkGray
            self.titleLabel.text = "Not Listening"
            clearObserver()
        }
    }
    
    func clearObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setupObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleNotification(_:)), name: .myNotification, object: nil)
    }
    
    @objc func handleNotification(_ sender: Notification) {
        titleLabel.text = sender.userInfo?["name"] as? String
    }
}
