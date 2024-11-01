//
//  BC67AnimationWithValue.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 10/22/24.
//

import SwiftUI

/// Animations linked to state variables
struct BC67AnimationWithValue: View {
    
    @State private var animate1: Bool = false
    @State private var animate2: Bool = false

    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Button {
                    animate1.toggle()
                } label: {
                    Text("Action 1")
                }

                Button {
                    animate2.toggle()
                } label: {
                    Text("Action 2")
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .frame(maxWidth: .infinity, alignment: animate1 ? .leading : .trailing)
                        .background(Color.green)
                        .frame(maxHeight: .infinity, alignment: animate2 ? .top : .bottom)
                        .background(Color.orange)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)
            }
        }
        .animation(.spring(), value: animate1)
        .animation(.linear(duration: 5), value: animate2)
    }
}

#Preview {
    BC67AnimationWithValue()
}
