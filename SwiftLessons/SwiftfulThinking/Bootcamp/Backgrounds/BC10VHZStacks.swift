//
//  BC10VHZStacks.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/19/23.
//
//background for simple zstack for more complex

import SwiftUI

struct BC10VHZStacks: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(.yellow)
                .frame(width: 350, height: 500, alignment: .center)
            
            VStack(alignment: .leading, spacing: 0) {
                Rectangle()
                    .fill(.red)
                    .frame(width: 150, height: 150)
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                
                HStack(alignment: .bottom, spacing: nil) {
                    Rectangle()
                        .fill(.purple)
                        .frame(width: 50, height: 50)
                    Rectangle()
                        .fill(.pink)
                        .frame(width: 75, height: 75)
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 25, height: 25)
                }
                .background(.white)
            }
            .background(.black)
        }
    }
}

struct BC10VHZStacks_Previews: PreviewProvider {
    static var previews: some View {
        BC10VHZStacks()
    }
}
