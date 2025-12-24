//
//  BC75ControlGroup.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 12/24/25.
//

import SwiftUI

struct BC75ControlGroup: View {
    
    var body: some View {
        Menu("My Menu") {
            ControlGroup {
                Button("One") {}
                
                Button("Two") {}
                
                Menu("Drop Down") {
                    Button("One") {}
                    
                    Button("Two") {}
                }
            }
            
            Menu("Drop Down") {
                Button("One") {}
                
                Button("Two") {}
                
                Menu("Drop Down") {
                    Button("One") {}
                    
                    Button("Two") {}
                }
            }
        }
    }
}

#Preview {
    BC75ControlGroup()
}
