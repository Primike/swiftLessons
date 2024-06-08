//
//  AnimationsViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 5/16/23.
//

import Foundation
import UIKit

class AnimationsViewController: UIViewController {
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertViewTopConstraint: NSLayoutConstraint!
    var isActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideAlert()
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
//        animateAlert(show: !isActive)
        springAnimate(show: !isActive)
    }
    
    private func animateAlert(show: Bool) {
        UIView.animate(withDuration: 0.6) { [weak self] in
            if show {
                self?.showAlert()
            } else {
                self?.hideAlert()
            }
            
            self?.view.layoutIfNeeded()
        }
    }
    
    private func springAnimate(show: Bool) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.4, options: []) { [weak self] in
            if show {
                self?.showAlert()
            } else {
                self?.hideAlert()
            }
            
            self?.view.layoutIfNeeded()
        } completion: { _ in
            print("The animation is complete!")
        }

    }
    
    private func showAlert() {
        isActive = true
        alertViewTopConstraint.constant = 20

    }
    
    private func hideAlert() {
        isActive = false
        alertViewTopConstraint.constant = -(alertView.frame.origin.y) - alertView.frame.height
    }
}
