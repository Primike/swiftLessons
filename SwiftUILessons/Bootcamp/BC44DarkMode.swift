//
//  BC44DarkMode.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/19/23.
//

import SwiftUI

struct BC44DarkMode: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Primary")
                        .foregroundColor(.primary)
                    Text("Secondary")
                        .foregroundColor(.secondary)
                    Text("Black")
                        .foregroundColor(.black)
                    Text("White")
                        .foregroundColor(.white)
                    Text("Red")
                        .foregroundColor(.red)
                    Text("Globally Adaptive")
                        .foregroundColor(Color("Chungus"))
                    Text("Locally Adaptive")
                        .foregroundColor(colorScheme == .light ? .green : .yellow)
                }
            }
            .navigationTitle("Dark Mode Bootcamp")
        }
    }
}

struct BC44DarkMode_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BC44DarkMode()
                .preferredColorScheme(.light)
            
            BC44DarkMode()
                .preferredColorScheme(.dark)
        }
    }
}
