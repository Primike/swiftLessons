//
//  BC55SystemMaterials.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/24/23.
//

import SwiftUI

struct BC55SystemMaterials: View {
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
        }
        .ignoresSafeArea()
        .background(
            Image("Chungus")
                .resizable()
                .ignoresSafeArea()
        )
    }
}

struct BC55SystemMaterials_Previews: PreviewProvider {
    static var previews: some View {
        BC55SystemMaterials()
    }
}
