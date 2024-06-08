//
//  RetainCycleViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 2/4/23.
//

import UIKit

class RetainCycleViewController: UIViewController {

    var peter: RetainCycleUser?
    var lois: RetainCycleUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peter = RetainCycleUser(firstName: "Peter", lastName: "Griffin")
        lois = RetainCycleUser(firstName: "Lois", lastName: "Quagmire")
        
        peter?.spouse = lois //1 Reference (weak)
        lois?.spouse = peter //1
        
        peter = nil
        lois = nil
        
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .cyan
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("Chungus"), object: nil, queue: .main) { [weak self] _ in
            self?.view.backgroundColor = .red
        }
    }
    
    deinit {
        print("Second VC has been removed from memory")
    }
}

class RetainCycleUser {
    let firstName: String
    let lastName: String
    weak var spouse: RetainCycleUser?
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    deinit {
        print("\(firstName) has been removed from memory")
    }
}
