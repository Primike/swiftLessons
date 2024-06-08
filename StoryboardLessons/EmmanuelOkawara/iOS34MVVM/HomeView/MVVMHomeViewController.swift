//
//  MVVMHomeViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 5/16/23.
//

import Foundation
import UIKit

class MVVMHomeViewController: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
    //    private var cancellables: Set<AnyCancellable> = []
    private let viewModel = MVVMHomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBinders()
        viewModel.getLoggedInUser()
    }
    
    private func setupBinders() {
        viewModel.welcomeMessage.bind { [weak self] message in
            self?.welcomeLbl.text = message
        }
        
//        viewModel.$welcomeMessage.sink { [weak self] message in
//            self?.welcomeLbl.text = message
//        }.store(in: &cancellables)
    }
}
