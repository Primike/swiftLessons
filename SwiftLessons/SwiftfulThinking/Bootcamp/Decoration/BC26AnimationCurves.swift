//
//  BC26AnimationCurves.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 5/5/23.
//

import SwiftUI

struct BC26AnimationCurves: View {
    
    @State var isAnimating: Bool = false
    let timing: Double = 1.0
    
    var body: some View {
        VStack {
            Button("Button") {
                withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 1.0)) {
                    isAnimating.toggle()
                }
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.linear(duration: timing), value: isAnimating)
        }
    }
}

struct BC26AnimationCurves_Previews: PreviewProvider {
    static var previews: some View {
        BC26AnimationCurves()
    }
}
