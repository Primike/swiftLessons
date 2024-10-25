//
//  BC71ViewThatFits.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 10/23/24.
//

import SwiftUI

/// View that fits chooses the text that best fits in the screen
struct BC71ViewThatFits: View {
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            ViewThatFits {
                Text("This is some text that I would like to display to the user")
                Text("This is some text that I would like to display")
                Text("This is some text")
            }
        }
        .frame(height: 300)
        .padding(50)
        .font(.headline)
    }
}

#Preview {
    BC71ViewThatFits()
}
