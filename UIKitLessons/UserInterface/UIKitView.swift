//
//  UIKitView.swift
//  UIKitLessons
//
//  Created by Prince Avecillas on 6/8/24.
//

import Foundation
import UIKit

// MARK: - UIViewController
class UIKitViewVC: UIViewController {
    
    lazy var uiKitView: UIView = {
        var view = UIKitView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Measuring in autolayout. Mostly for dynamic cell sizes
    // Used for stuff like heightForCellInRow
    lazy var view1: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let targetSize = CGSize(width: 300, height: UIView.layoutFittingCompressedSize.height)
        let optimalSize = view.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        view.frame.size = optimalSize
        return view
    }()
    
    // Acts as an invisible view/spacer, can remove/add
    lazy var layoutGuide: UILayoutGuide = {
        var layout = UILayoutGuide()
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
    }
    
    private func setup() {
        view.layoutMargins = UIEdgeInsets(top: 100, left: 20, bottom: 30, right: 50)
    }
    
    /// Layouts with margins and without margins
    private func layout() {
        view.addSubview(uiKitView)
        view.addLayoutGuide(layoutGuide)
        
        NSLayoutConstraint.activate([
//            uiKitView.topAnchor.constraint(equalTo: view.topAnchor),
//            uiKitView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            uiKitView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            uiKitView.trailingAnchor.constraint(equalTo: view.trailingAnchor)

            // Sets margins for view must use view.layoutMarginsGuide
            uiKitView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            uiKitView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            uiKitView.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            uiKitView.bottomAnchor.constraint(equalTo: layoutGuide.topAnchor),

            layoutGuide.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            layoutGuide.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            layoutGuide.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            layoutGuide.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}



// MARK: - UIView
class UIKitView: UIView {
    
    lazy var textLabel: UILabel = {
        var label = UILabel()
        label.text = "Text"
        label.backgroundColor = .cyan
        label.translatesAutoresizingMaskIntoConstraints = false
        // Resist compression/extension when contents change like text amount
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
        
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    // Because UIView conforms to NSCoding this init is required
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        customization()
        layout()
        
        viewHierarchy()
    }
    
    private func layout() {
        addSubview(textLabel)

        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        let constraint = textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        addConstraint(constraint)
    }
}

extension UIKitView {
    
    /// Customization
    private func customization() {
        backgroundColor = .lightGray
        isHidden = false
        clipsToBounds = true
        
        isUserInteractionEnabled = true
        // only this view can respond to touch where its located on screen
        isExclusiveTouch = false
    }
    
    /// Transformations
    private func transformations() {
        // transform = CGAffineTransform(rotationAngle: .pi / 4)
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 500.0
        transform = CATransform3DRotate(transform, .pi / 4, 1, 0, 0)
        layer.transform = transform
        
        layer.anchorPoint = CGPoint(x: 0, y: 0)
        center = CGPoint(x: 50, y: 50)
    }
    
    /// View Hierarchy
    private func viewHierarchy() {
        if let parentView = superview { print(parentView) }
        print(subviews)
        
        bringSubviewToFront(textLabel)
        
        Task {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            await MainActor.run {
                textLabel.removeFromSuperview()
            }
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            // can insert.delete/swap subviews and self
            await MainActor.run {
                insertSubview(textLabel, aboveSubview: self)
                layout()
            }
        }
    }
    
    // There are a few view event handleing methods like this one
    // Superclass implementation does nothing
    override func didAddSubview(_ subview: UIView) {
        print("Added a subview")
    }
}
