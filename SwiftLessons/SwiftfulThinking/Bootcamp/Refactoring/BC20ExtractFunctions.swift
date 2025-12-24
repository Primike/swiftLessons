//
//  BC20ExtractingFunctions.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/20/23.
//

import SwiftUI

struct BC20ExtractFunctions: View {
    
    @State var backgroundColor: Color = .pink
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            contentLayer
        }
    }
    
    var contentLayer: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
            
            Button {
                buttonPressed()
            } label: {
                Text("PRESS ME")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
            }
        }
    }
    
    func buttonPressed() {
        backgroundColor = backgroundColor == .yellow ? .pink : .yellow
    }
}

struct BC20ExtractingFunctions_Previews: PreviewProvider {
    static var previews: some View {
        BC20ExtractFunctions()
    }
}
