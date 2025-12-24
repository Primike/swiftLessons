//
//  BC17SafeArea.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/20/23.
//

import SwiftUI

struct BC17SafeArea: View {
    
    var body: some View {
        ScrollView {
            VStack{
                Text("Title goes here")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding(20)
                }
            }
        }
        .background(
            Color.red
                .ignoresSafeArea()
        )
    }
}

struct BC17SafeArea_Previews: PreviewProvider {
    static var previews: some View {
        BC17SafeArea()
    }
}
