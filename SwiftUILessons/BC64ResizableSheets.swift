//
//  BC64ResizableSheets.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/27/23.
//

import SwiftUI

struct BC64ResizableSheets: View {
    
    @State private var showSheet: Bool = false
    @State private var detents: PresentationDetent = .large
    
    var body: some View {
        Button {
            showSheet.toggle()
        } label: {
            Text("Click me")
        }
        .sheet(isPresented: $showSheet) {
            BC64MyNextView(detents: $detents)
//                .presentationDetents([.medium, .large])
//                .presentationDetents([.fraction(0.3), .large])
//                .presentationDragIndicator(.hidden)
//                .interactiveDismissDisabled()
        }
    }
}

struct BC64MyNextView: View {
    
    @Binding var detents: PresentationDetent
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            VStack(spacing: 20) {
                //can only set detents used in the presentation
                Button("Medium") {
                    detents = .medium
                }

                Button("Large") {
                    detents = .large
                }
            }
        }
        .presentationDetents([.medium, .large], selection: $detents)
    }
}

struct BC64ResizableSheets_Previews: PreviewProvider {
    static var previews: some View {
        BC64ResizableSheets()
    }
}
