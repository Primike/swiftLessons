//
//  AL12CustomNavView.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/15/23.
//

import SwiftUI

struct AL12CustomNavView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            AL12CustomNavBarContainer {
                content
            }
            .toolbar(.hidden)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AL12CustomNavView_Previews: PreviewProvider {
    static var previews: some View {
        AL12CustomNavView {
            Color.red.ignoresSafeArea()
        }
    }
}

//Adds back the swipe gesture
extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
