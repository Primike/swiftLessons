//
//  BC65SafeAreaInserts.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/28/23.
//

import SwiftUI

struct BC65SafeAreaInserts: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { _ in
                Rectangle()
                    .frame(height: 300)
            }
            .navigationTitle("Safe Area Inserts")
            .safeAreaInset(edge: .bottom, alignment: .trailing, spacing: nil) {
                Text("Hello")
//                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.yellow)
                    .clipShape(Circle())
                    .padding()
            }
        }
    }
}

struct BC65SafeAreaInserts_Previews: PreviewProvider {
    static var previews: some View {
        BC65SafeAreaInserts()
    }
}
