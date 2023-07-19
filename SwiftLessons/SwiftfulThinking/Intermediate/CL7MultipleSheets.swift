//
//  CL7MultipleSheets.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/4/23.
//

import SwiftUI

struct CL7RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct CL7MultipleSheets: View {
    @State var selectedModel: CL7RandomModel? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = CL7RandomModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                CL7NextScreen(selectedModel: model)
            }
        }
    }
}

struct CL7NextScreen: View {
    let selectedModel: CL7RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct CL7MultipleSheets_Previews: PreviewProvider {
    static var previews: some View {
        CL7MultipleSheets()
    }
}
