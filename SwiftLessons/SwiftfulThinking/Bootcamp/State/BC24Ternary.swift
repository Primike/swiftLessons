//
//  BC24Ternary.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 5/5/23.
//

import SwiftUI

struct BC24Ternary: View {
    
    @State var isStartingState: Bool = false
    
    var body: some View {
        VStack {
            Button("Button: \(isStartingState.description)") {
                isStartingState.toggle()
            }
            
            Text(isStartingState ? "Starting" : "Ending")
            
            RoundedRectangle(cornerRadius: isStartingState ? 25 : 0)
                .fill(isStartingState ? .red : .blue)
                .frame(width: isStartingState ? 200 : 50, height: isStartingState ? 400 : 50)
            
            
            Spacer()
        }
    }
}

struct BC24Ternary_Previews: PreviewProvider {
    static var previews: some View {
        BC24Ternary()
    }
}
