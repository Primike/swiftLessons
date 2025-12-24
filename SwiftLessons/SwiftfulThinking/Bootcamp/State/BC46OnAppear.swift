//
//  BC46OnAppear.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/19/23.
//

import SwiftUI

struct BC46OnAppear: View {
    
    @State var myText: String = "Start Text."
    @State var count: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .padding()
                        // Triggers for items still not on screen
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear {
                Task {
                    try? await Task.sleep(nanoseconds: 5_000_000_000)
                    await MainActor.run {
                        myText = "New Text"
                    }
                }
            }
            .navigationTitle("On Appear \(count)")
        }
    }
}

struct BC46OnAppear_Previews: PreviewProvider {
    static var previews: some View {
        BC46OnAppear()
    }
}
