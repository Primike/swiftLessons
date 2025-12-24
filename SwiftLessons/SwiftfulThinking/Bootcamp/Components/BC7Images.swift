//
//  BC7Images.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/19/23.
//

import SwiftUI

struct BC7Images: View {
    
    var body: some View {
        Image("Chungus")
//            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300)
//            .clipped()
            .cornerRadius(150)
            .foregroundColor(.blue)
//            .clipShape(
//                Circle()
//                RoundedRectangle(cornerRadius: 25)
//                Ellipse()
//            )
    }
}

struct BC7Images_Previews: PreviewProvider {
    static var previews: some View {
        BC7Images()
    }
}
