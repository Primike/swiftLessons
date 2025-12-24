//
//  BC27Transitions.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 5/5/23.
//

import SwiftUI

// Does not work in canvas
struct BC27Transitions: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button("Button") {
                    withAnimation(.easeInOut) {
                        showView.toggle()
                    }
                }
                
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(.asymmetric(insertion: .slide, removal: .rotating(rotation: 360.0)))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct BC27Transitions_Previews: PreviewProvider {
    static var previews: some View {
        BC27Transitions()
    }
}
