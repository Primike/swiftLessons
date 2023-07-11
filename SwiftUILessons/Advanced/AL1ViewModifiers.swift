//
//  AL1ViewModifiers.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/10/23.
//

import SwiftUI

struct AL1ButtonModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    func withDefaultButtonFormatting(color: Color = .blue) -> some View {
        modifier(AL1ButtonModifier(backgroundColor: color))
    }
}

struct AL1ViewModifiers: View {
    var body: some View {
        VStack {
            Text("Hello")
                .withDefaultButtonFormatting()
            Text("Hello")
                .withDefaultButtonFormatting(color: .green)
        }
    }
}

struct AL1ViewModifiers_Previews: PreviewProvider {
    static var previews: some View {
        AL1ViewModifiers()
    }
}
