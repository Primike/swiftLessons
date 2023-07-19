//
//  BC6Icons.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 3/19/23.
//

import SwiftUI

struct BC6Icons: View {
    var body: some View {
        Image(systemName: "person.fill.badge.plus")
            .renderingMode(.original)
//            .resizable()
//            .aspectRatio(contentMode: .fill)
            .font(.largeTitle)
//            .font(.system(size: 200))
//            .foregroundColor(Color("Chungus"))
//            .frame(width: 300, height: 300)
//            .clipped()
        
    }
}

struct BC6Icons_Previews: PreviewProvider {
    static var previews: some View {
        BC6Icons()
    }
}
