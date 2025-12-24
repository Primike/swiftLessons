//
//  BC57ButtonStyles.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/24/23.
//

import SwiftUI

struct BC57ButtonStyles: View {
    
    var body: some View {
        VStack {
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.plain)
            
            
            Button(action: {
                
            }, label: {
                Text("Button Title")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle(radius: 20))
            .controlSize(.large)

            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)

            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderless)

        }
        .padding()
    }
}

struct BC57ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        BC57ButtonStyles()
    }
}
