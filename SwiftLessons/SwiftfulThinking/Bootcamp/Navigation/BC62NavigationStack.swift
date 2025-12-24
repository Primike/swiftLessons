//
//  BC62NavigationStack.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/25/23.
//

import SwiftUI

struct BC62NavigationStack: View {
    
    let fruits = ["Apple", "Orange", "Banana"]
    @State private var stackPath: [String] = []
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            ScrollView {
                VStack(spacing: 40) {
                    Button("Super segue") {
                        stackPath.append(contentsOf: [
                            "Coconut", "Watermelon", "Mango"
                        ])
                    }
                    
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruit) {
                            Text(fruit)
                        }
                    }
                }
            }
            .navigationTitle("Nav Bootcamp")
            .navigationDestination(for: String.self) { string in
                Text("Screen: \(string)")
                    .font(.largeTitle)
            }
        }
    }
}

struct BC62NavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        BC62NavigationStack()
    }
}
