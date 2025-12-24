//
//  BC12Spacer.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/19/23.
//

import SwiftUI

struct BC12Spacer: View {
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Image(systemName: "xmark")
                Spacer()
                    .frame(height: 10)
                    .background(.orange)
                
                Image(systemName: "gear")
            }
            .font(.title)
            .padding(.horizontal)
            
            Spacer()
                .frame(width: 10)
                .background(.orange)
            
            Rectangle()
                .frame(height: 55)
        }
        .background(.yellow)
    }
}

struct BC12SpacerStack: View {
    var body: some View {
        HStack(spacing: 0) {
            Spacer(minLength: 0)
                .frame(height: 10)
                .background(.orange)
            Rectangle()
                .frame(width: 50, height: 50)
            Spacer()
                .frame(height: 10)
                .background(.orange)
            Rectangle()
                .fill(.red)
                .frame(width: 50, height: 50)
            Spacer()
                .frame(height: 10)
                .background(.orange)
            Rectangle()
                .fill(.green)
                .frame(width: 50, height: 50)
            Spacer(minLength: 0)
                .frame(height: 10)
                .background(.orange)
        }
        .background(.yellow)
        .padding(.horizontal, 200)
        .background(.blue)
    }
}

struct BC12Spacer_Previews: PreviewProvider {
    static var previews: some View {
        BC12Spacer()
    }
}
