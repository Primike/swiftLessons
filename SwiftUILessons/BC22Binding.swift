//
//  BC22Binding.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/20/23.
//

import SwiftUI

struct BC22Binding: View {
    @State var backgroundColor: Color = .green
    @State var title: String = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

struct ButtonView: View {
    @Binding var backgroundColor: Color
    @Binding var title: String
    @State var buttonColor: Color = .blue
    
    var body: some View {
        Button {
            backgroundColor = .orange
            buttonColor = .pink
            title = "New Title!!!"
        } label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        }
    }
}

struct BC22Binding_Previews: PreviewProvider {
    static var previews: some View {
        BC22Binding()
    }
}
