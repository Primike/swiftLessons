//
//  AL11CustomTabBar.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/14/23.
//

import SwiftUI

struct AL11CustomTabBar: View {
    
    let tabs: [AL11TabBarItem]
    @Binding var selection: AL11TabBarItem
    @Namespace private var namespace
    @State var localSelection: AL11TabBarItem
    
    var body: some View {
        tabBarVersion2
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

extension AL11CustomTabBar {
    
    private func tabView(tab: AL11TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? tab.color.opacity(0.2) : .clear)
        .cornerRadius(10)
    }
    
    private var tabBarVersion1: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
    
    private func switchToTab(tab: AL11TabBarItem) {
        selection = tab
    }
}

extension AL11CustomTabBar {
    
    private func tabView2(tab: AL11TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
    }
    
    private var tabBarVersion2: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}

struct AL11CustomTabBar_Previews: PreviewProvider {
    
    static let tabs: [AL11TabBarItem] = [
        .home, .favorites, .profile
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            AL11CustomTabBar(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}
