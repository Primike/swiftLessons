//
//  AL11TabBarContainer.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/14/23.
//

import SwiftUI

struct AL11TabBarContainer<Content: View>: View {
    
    @Binding var selection: AL11TabBarItem
    let content: Content
    @State private var tabs: [AL11TabBarItem] = []
    
    init(selection: Binding<AL11TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            
            AL11CustomTabBar(tabs: tabs, selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(AL11TabBarPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct AL11TabBarContainer_Previews: PreviewProvider {
    static let tabs: [AL11TabBarItem] = [
        .home, .favorites, .profile
    ]

    static var previews: some View {
        AL11TabBarContainer(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
