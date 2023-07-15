//
//  AL11TabBarPreferenceKey.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/14/23.
//

import Foundation
import SwiftUI

struct AL11TabBarPreferenceKey: PreferenceKey {
    
    static var defaultValue: [AL11TabBarItem] = []
    
    static func reduce(value: inout [AL11TabBarItem], nextValue: () -> [AL11TabBarItem]) {
        value += nextValue()
    }
}

struct AL11TabBarItemViewModifier: ViewModifier {
    
    let tab: AL11TabBarItem
    @Binding var selection: AL11TabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1 : 0)
            .preference(key: AL11TabBarPreferenceKey.self, value: [tab])
    }
}

extension View {
    
    func tabBarItem(tab: AL11TabBarItem, selection: Binding<AL11TabBarItem>) -> some View {
        modifier(AL11TabBarItemViewModifier(tab: tab, selection: selection))
    }
}
