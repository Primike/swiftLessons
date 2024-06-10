//
//  ViewController.swift
//  UIKitLessons
//
//  Created by Prince Avecillas on 6/8/24.
//

import UIKit

class UIKitLessonsViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        var title = UILabel()
        title.text = "Title"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        layout()
        print(UIDeviceUIKit.printDetails())
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
