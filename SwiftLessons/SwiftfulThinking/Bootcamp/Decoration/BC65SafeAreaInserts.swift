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
            .toolbarBackground(.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationTitle("Safe Area Inserts")
            .navigationBarTitleDisplayMode(.inline)
            .safeAreaInset(edge: .bottom, alignment: .trailing, spacing: nil) {
                Text("Hello")
                    .padding()
                    .background(.yellow)
                    .clipShape(Circle())
                    .padding()
            }
            .safeAreaInset(edge: .top) {
                Text("Top Text")
                    .padding()
                    .background(.green)
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
