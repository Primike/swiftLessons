//
//  SecondObserverViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 1/29/23.
//

import UIKit

var secondVCIsListening = false

class SecondObserverViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var listeningSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if secondVCIsListening {
            listeningSwitch.setOn(true, animated: false)
            switchToggled(listeningSwitch)
            setupObserver()
        }
    }
    
    deinit {
        clearObserver()
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            self.view.backgroundColor = .green
            self.titleLabel.text = "Listening"
            secondVCIsListening = true
            setupObserver()
        } else {
            self.view.backgroundColor = .darkGray
            self.titleLabel.text = "Not Listening"
            secondVCIsListening = false
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
