//
//  BC59Badges.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/24/23.
//

import SwiftUI

struct BC59Badges: View {
    
    var body: some View {
        TabView {
            List {
                Text("Some Text")
                    .badge("Items")
                Text("Some Text")
                    .badge(1)
                Text("Some Text")
            }
            .tabItem {
                Image(systemName: "heart.fill")
                Text("Hello")
            }
            .badge(1)

            Color.green
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
                .badge(0)

            Color.blue
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
        }
    }
}

struct BC59Badges_Previews: PreviewProvider {
    static var previews: some View {
        BC59Badges()
    }
}
