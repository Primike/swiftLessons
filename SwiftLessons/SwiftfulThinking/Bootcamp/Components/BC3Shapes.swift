//
//  BC3Shapes.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/19/23.
//

import SwiftUI

struct BC3Shapes: View {
    
    var body: some View {
//        Circle()
//        Ellipse()
//        Capsule(style: .circular)
//        Rectangle()
        RoundedRectangle(cornerRadius: 20)
//            .fill(Color.green)
//            .foregroundColor(.pink)
//            .stroke(.blue, style: StrokeStyle(lineWidth: 20, lineCap: .butt, dash: [10]))
            .trim(from: 0.2, to: 1.0)
            .frame(width: 200, height: 100, alignment: .leading)
    }
}

struct BC3Shapes_Previews: PreviewProvider {
    static var previews: some View {
        BC3Shapes()
    }
}
