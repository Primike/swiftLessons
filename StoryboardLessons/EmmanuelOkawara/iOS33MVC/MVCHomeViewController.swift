//
//  MVCHomeViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 5/16/23.
//

import Foundation
import UIKit

class MVCHomeViewController: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
    var user: MVCUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        user = MVCNetworkService.shared.getLoggedInUser()
        welcomeUser()
    }
    
    private func welcomeUser() {
        welcomeLbl.text = "Hello, \(user.firstName) \(user.lastName)"
    }
}
