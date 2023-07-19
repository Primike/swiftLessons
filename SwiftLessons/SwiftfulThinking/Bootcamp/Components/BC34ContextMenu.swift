//
//  BC34ContextMenu.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/17/23.
//

import SwiftUI

struct BC34ContextMenu: View {
    
    @State var backgroundColor: Color = .blue
    
    //Press and hold
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "house.fill")
                .font(.title)
            
            Text("Swiftful Thinking")
                .font(.headline)
            
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(30)
        .background(backgroundColor.cornerRadius(30))
        .contextMenu {
            Button {
                backgroundColor = .yellow
            } label: {
                Label("Share Post", systemImage: "flame.fill")
            }

            Button {
                backgroundColor = .red
            } label: {
                Text("Report Post")
            }
            
            Button {
                backgroundColor = .green
            } label: {
                HStack {
                    Text("Like Post")
                    Image(systemName: "heart.fill")
                }
            }
        }
    }
}

struct BC34ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        BC34ContextMenu()
    }
}
