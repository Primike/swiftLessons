//
//  SwiftExtrasView.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 10/26/24.
//

import SwiftUI

struct SwiftExtrasView: View {
    
    @StateObject private var viewModel = UdemyCombineViewModel()
    
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                viewModel.debuggingPublisher()
            }
    }
}

#Preview {
    SwiftExtrasView()
}
