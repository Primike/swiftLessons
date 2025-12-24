//
//  BC5Gradients.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/19/23.
//

import SwiftUI

struct BC5Gradients: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
//                .red
//                LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .topLeading, endPoint: .bottom)
//                .radialGradient(Gradient(colors: [.blue, .black]), center: .leading, startRadius: 5, endRadius: 400)
                AngularGradient(
                    gradient: Gradient(colors: [.blue, .black]),
                    center: .topLeading,
                    angle: .degrees(180 + 45)
                )
            )
            .frame(width: 300, height: 200)
    }
}

struct BC5Gradients_Previews: PreviewProvider {
    static var previews: some View {
        BC5Gradients()
    }
}
