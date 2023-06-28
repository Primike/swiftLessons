//
//  BC63Toolbar.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/26/23.
//

import SwiftUI

struct BC63Toolbar: View {
    
    @State private var text: String = ""
    @State private var paths: [String] = []

    var body: some View {
        NavigationStack(path: $paths) {
            ZStack {
                Color.white.ignoresSafeArea()
                
                ScrollView {
                    TextField("Placeholder", text: $text)
                    
                    ForEach(0..<50) { _ in
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 200, height: 200)
                    }
                }
            }
            .navigationTitle("Toolbar")
//            .navigationBarItems(
//                leading: Image(systemName: "heart.fill"),
//                trailing: Image(systemName: "gear"))
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
//            .navigationBarHidden(true)
//            .toolbar(.hidden, for: .navigationBar)
//            .toolbarBackground(.hidden, for: .navigationBar)
//            .toolbarColorScheme(.dark, for: .navigationBar)
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
