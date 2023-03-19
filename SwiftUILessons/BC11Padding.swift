//
//  BC11Padding.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/19/23.
//

import SwiftUI

struct BC11Padding: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, Chungus")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
            Text("This is the text for this big chungus lesson. Big chunugs is a fat rabbit. Doge is a doge that became a coin")
        }
        .padding()
        .padding(.vertical, 10)
        .background(
            Color.white
            
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3),
                        radius: 10, x: 0.0, y: 10)
        )
        .padding(.horizontal, 10)
    }
}

struct BC11Padding_Previews: PreviewProvider {
    static var previews: some View {
        BC11Padding()
    }
}
