//
//  AnimatingLayersViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 5/16/23.
//

import Foundation
import UIKit

class AnimatingLayersViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.rotateFlag()
            self.animateRadius()
        }
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        guard validateEmail() else {
            shakeField(emailField)
            return
        }
        
        guard validatePassword() else {
            shakeField(passwordField)
            return
        }
    }
    
    private func shakeField(_ field: UITextField) {
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.08, 0.25, 0.415, 0.5]
        animation.duration = 0.5
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        field.layer.add(animation, forKey: nil)
    }
    
    private func validateEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: emailField.text!)
    }
    
    private func validatePassword() -> Bool {
        return passwordField.text!.count >= 8
    }
    
    private func rotateFlag() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = CGFloat.pi * 2
        animation.duration = 3
        animation.repeatCount = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        imageView.layer.add(animation, forKey: nil)
    }
    
    private func animateRadius() {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = 0
        animation.toValue = 50
        animation.duration = 3
        animation.autoreverses = true
        animation.repeatCount = .infinity
        
        imageView.layer.add(animation, forKey: nil)
        
//        UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .autoreverse], animations: { [weak self] in
//            self?.imageView.layer.cornerRadius = 50
//        }, completion: nil)
    }
}
