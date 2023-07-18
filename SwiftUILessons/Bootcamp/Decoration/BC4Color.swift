//
//  BC4Color.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/19/23.
//

import SwiftUI

struct BC4Color: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
//                Color("Chungus")
                Color(UIColor.systemGroupedBackground)
            )
            .frame(width: 300, height: 200)
            .shadow(color: Color("Chungus").opacity(0.3), radius: 10, x: -20, y: -20)
    }
}

struct BC4Color_Previews: PreviewProvider {
    static var previews: some View {
        BC4Color()
    }
}
