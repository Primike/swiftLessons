//
//  BC62NavigationStack.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/25/23.
//

import SwiftUI

struct BC62NavigationStack: View {
    
    let fruits = ["Apple", "Orange", "Banana"]
    @State private var stackPath: [String] = ["Doge"]
    
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

                    ForEach(0..<10) { i in
                        NavigationLink(value: i) {
                            Text("Click: \(i)")
                        }
                        
//                        NavigationLink {
//                            BC62SecondScreen(value: i)
//                        } label: {
//                            Text("Click: \(i)")
//                        }
                    }
                }
            }
            .navigationTitle("Nav Bootcamp")
            .navigationDestination(for: Int.self) { i in
                BC62SecondScreen(value: i)
            }
            .navigationDestination(for: String.self) { string in
                Text("Screen: \(string)")
                    .font(.largeTitle)
            }
        }
    }
}

struct BC62SecondScreen: View {
    let value: Int
    
    init(value: Int) {
        self.value = value
        print("init")
    }
    
    var body: some View {
        Text("Screen \(value)")
    }
}

struct BC62NavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        BC62NavigationStack()
    }
}
