//
//  AL11AppTabBar.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/14/23.
//

import SwiftUI

struct AL11AppTabBar: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: AL11TabBarItem = .home
    
    var body: some View {
        AL11TabBarContainer(selection: $tabSelection) {
            Color.blue
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            Color.red
                .tabBarItem(tab: .favorites, selection: $tabSelection)
            
            Color.green
                .tabBarItem(tab: .profile, selection: $tabSelection)
            
            Color.orange
                .tabBarItem(tab: .messages, selection: $tabSelection)
        }
    }
}

extension AL11AppTabBar {
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Color.red
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }

            Color.red
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

struct AL11AppTabBar_Previews: PreviewProvider {
    
    static var previews: some View {
        AL11AppTabBar()
    }
}
