//
//  AL2ButtonStyles.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/10/23.
//

import SwiftUI

struct AL2ButtonStyle: ButtonStyle {
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat = 1.1) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1)
//            .brightness(configuration.isPressed ? 0.5 : 0)
            .opacity(configuration.isPressed ? 0.2 : 1.0)
    }
}

extension View {
    func withPressableStyle(scaledAmount: CGFloat = 1.1) -> some View {
        buttonStyle(AL2ButtonStyle(scaledAmount: scaledAmount))
    }
}

struct AL2ButtonStyles: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0.0, y: 10)
        }
        .withPressableStyle(scaledAmount: 1.1)
//        .buttonStyle(AL2ButtonStyle(scaledAmount: 1.1))
        .padding(40)
    }
}

struct AL2ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        AL2ButtonStyles()
    }
}
