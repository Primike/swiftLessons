//
//  AL12CustomNavBarContainer.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/15/23.
//

import SwiftUI

struct AL12CustomNavBarContainer<Content: View>: View {
    
    let content: Content
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var subtitle: String? = nil
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            AL12CustomNavBar(showBackButton: showBackButton, title: title, subtitle: subtitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(AL12NavTitlePreferenceKey.self) { value in
            self.title = value
        }
        .onPreferenceChange(AL12NavSubtitlePreferenceKey.self) { value in
            self.subtitle = value
        }
        .onPreferenceChange(AL12NavBackButtonPreferenceKey.self) { value in
            self.showBackButton = !value
        }
    }
}

struct AL12CustomNavBarContainer_Previews: PreviewProvider {
    static var previews: some View {
        AL12CustomNavBarContainer {
            ZStack {
                Color.green.ignoresSafeArea()
                
                Text("Hello")
                    .foregroundColor(.white)
                    .customNavigationTitle("Title")
                    .customNavigationSubtitle("Subtitle")
                    .customNavigationBackButton(true)
            }
        }
    }
}
