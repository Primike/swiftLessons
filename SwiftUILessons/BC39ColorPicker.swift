//
//  BC39ColorPicker.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/18/23.
//

import SwiftUI

struct BC39ColorPicker: View {
    
    @State var backgroundColor: Color = .green
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            ColorPicker("Select A Color", selection: $backgroundColor, supportsOpacity: true)
                .padding()
                .background(.black)
                .cornerRadius(10)
                .foregroundColor(.white)
                .font(.headline)
                .padding(50)
        }
    }
}

struct BC39ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        BC39ColorPicker()
    }
}
