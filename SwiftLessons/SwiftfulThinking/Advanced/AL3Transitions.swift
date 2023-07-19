//
//  AL3Transitions.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/10/23.
//

import SwiftUI

struct AL3RotateModifier: ViewModifier {
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
}

extension AnyTransition {
    static var rotating: AnyTransition {
        return modifier(active: AL3RotateModifier(rotation: 180), identity: AL3RotateModifier(rotation: 0))
    }
    
    static func rotating(rotation: Double) -> AnyTransition {
        return modifier(active: AL3RotateModifier(rotation: rotation), identity: AL3RotateModifier(rotation: 0))
    }
    
    static var rotateOn: AnyTransition {
        return asymmetric(
            insertion: .rotating,
            removal: .move(edge: .leading))
    }
}

struct AL3Transitions: View {
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.rotateOn)
//                    .transition(AnyTransition.rotating.animation(.easeInOut))
            }
            
            Spacer()
            
            Text("Click")
                .withDefaultButtonFormatting()
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1)) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

struct AL3Transitions_Previews: PreviewProvider {
    static var previews: some View {
        AL3Transitions()
    }
}
