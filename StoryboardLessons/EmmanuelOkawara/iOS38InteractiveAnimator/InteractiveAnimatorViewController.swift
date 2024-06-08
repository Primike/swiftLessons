//
//  InteractiveAnimatorViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 5/16/23.
//

import Foundation
import UIKit

class InteractiveAnimatorViewController: UIViewController {
    
    private var boxView: UIView!
    private var animation: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBox()
        setupAnimation()
    }
    
    private func setupAnimation() {
        animation = UIViewPropertyAnimator(duration: 1, curve: .easeInOut, animations: {
            self.boxView.layer.cornerRadius = self.boxView.frame.width / 2
            self.boxView.transform = self.boxView.transform.rotated(by: .pi)
            self.boxView.frame.origin.x = self.view.frame.width - 100
            self.view.backgroundColor = .black
        })
    }
    
    private func setupBox() {
        boxView = UIView(frame: CGRect(x: 0, y: view.center.y - 100 - 20, width: 100, height: 100))
        boxView.backgroundColor = .green
        
        view.addSubview(boxView)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        animation.fractionComplete = CGFloat(sender.value)
    }
}
