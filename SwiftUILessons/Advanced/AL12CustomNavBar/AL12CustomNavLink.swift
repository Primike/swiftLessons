//
//  AL12CustomNavLink.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/15/23.
//

import SwiftUI

struct AL12CustomNavLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label: Label
    
    init(@ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination()
        self.label = label()
    }
    
    var body: some View {
        NavigationLink {
            AL12CustomNavBarContainer {
                destination
            }
            .toolbar(.hidden)
        } label: {
            label
        }

    }
}

struct AL12CustomNavLink_Previews: PreviewProvider {
    static var previews: some View {
        AL12CustomNavView {
            AL12CustomNavLink {
                Text("Destination")
            } label: {
                Text("Click")
            }
        }
    }
}
