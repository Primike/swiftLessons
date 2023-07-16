//
//  AL12AppNavBar.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/15/23.
//

import SwiftUI

struct AL12AppNavBar: View {
    var body: some View {
        AL12CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                AL12CustomNavLink {
                    Text("Destination")
                        .customNavigationTitle("Second Screen")
                        .customNavigationSubtitle("Subtitle")
                } label: {
                    Text("Navigate")
                }
            }
            .customNavBarItems(title: "New Title", subtitle: "Subtitle", backButtonHidden: true)
        }
    }
}

extension AL12AppNavBar {
    
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink {
                    Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                } label: {
                    Text("Navigate")
                }

            }
            .navigationTitle("Nav Title")
        }
    }
}

struct AL12AppNavBar_Previews: PreviewProvider {
    static var previews: some View {
        AL12AppNavBar()
    }
}
