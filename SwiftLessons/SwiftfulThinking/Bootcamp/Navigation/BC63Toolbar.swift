//
//  BC63Toolbar.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/26/23.
//

import SwiftUI

struct BC63Toolbar: View {
    
    @State private var paths: [String] = []

    var body: some View {
        NavigationStack(path: $paths) {
            ScrollView {
                ForEach(0..<50) { _ in
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 200, height: 200)
                }
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("Toolbar")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "heart.fill")
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gear")
                }
                
                ToolbarItem(placement: .keyboard) {
                    Image(systemName: "person")
                }
            }
            .toolbarBackground(.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarTitleMenu {
                Button {
                    paths.append("Screen 1")
                } label: {
                    Text("Screen 1")
                }
            }
            .navigationDestination(for: String.self) { value in
                Text("New screen: \(value)")
            }
        }
    }
}

struct BC63Toolbar_Previews: PreviewProvider {
    static var previews: some View {
        BC63Toolbar()
    }
}
