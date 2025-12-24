//
//  BC76Observable.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 12/24/25.
//

import SwiftUI

@available(iOS 17.0, *)
@Observable class BC76ObservableViewModel {
    
    var title: String = "Some title"
}

@available(iOS 17.0, *)
struct BC76Observable: View {
    
    @State var viewModel = BC76ObservableViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            Button(viewModel.title) {
                viewModel.title = "New Title!"
            }
            
            BC76SomeChildView(viewModel: viewModel)
            
            BC76SomeThirdView()
        }
        .environment(viewModel)
    }
}

@available(iOS 17.0, *)
struct BC76SomeChildView: View {
    
    @Bindable var viewModel: BC76ObservableViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Child View"
        }
    }
}

@available(iOS 17.0, *)
struct BC76SomeThirdView: View {
    
    @Environment(BC76ObservableViewModel.self) var viewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Third View"
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    BC76Observable()
}
