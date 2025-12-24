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
                Button("20%") {
                    detents = .fraction(0.2)
                }
                
                Button("Medium") {
                    detents = .medium
                }
                
                Button("600 PX") {
                    detents = .height(600)
                }

                Button("Large") {
                    detents = .large
                }
            }
        }
        .presentationDetents([.fraction(0.2), .medium, .height(600), .large], selection: $detents)
        .presentationDragIndicator(.hidden)
    }
}

struct BC64ResizableSheets_Previews: PreviewProvider {
    static var previews: some View {
        BC64ResizableSheets()
    }
}
