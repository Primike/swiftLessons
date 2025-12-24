//
//  BC58SwipeActions.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/24/23.
//

import SwiftUI

struct BC58SwipeActions: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
            }
            .onDelete(perform: delete)
            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                Button("Archive") {
                    
                }
                .tint(.green)
                
                Button("Save") {
                    
                }
                .tint(.blue)

                Button("Junk") {
                    
                }
                .tint(.black)
            }
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                Button("Share") {
                    
                }
                .tint(.yellow)
            }
        }
    }
    
    func delete(indexSet: IndexSet) {
        
    }
}

struct BC58SwipeActions_Previews: PreviewProvider {
    static var previews: some View {
        BC58SwipeActions()
    }
}
