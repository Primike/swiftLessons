//
//  BC37Switch.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/18/23.
//

import SwiftUI

struct BC37Switch: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Status:")
                Text(toggleIsOn ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle(isOn: $toggleIsOn) {
                Text("Label")
            }
            .toggleStyle(SwitchToggleStyle(tint: .purple))
            
            Spacer()
        }
        .padding(.horizontal, 100)
    }
}

struct BC37Switch_Previews: PreviewProvider {
    static var previews: some View {
        BC37Switch()
    }
}
