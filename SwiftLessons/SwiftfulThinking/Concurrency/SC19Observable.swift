//
//  SC19Observable.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 12/26/25.
//

import SwiftUI

actor SC19TitleDatabase {
    func getNewTitle() -> String {
        return "Some new title!"
    }
}

@available(iOS 17.0, *)
@Observable @MainActor
class SC19ObservableViewModel {
    
    @ObservationIgnored let database = SC19TitleDatabase()
    var title: String = "Starting title"
    
    func updateTitle() async {
        title = await database.getNewTitle()
    }
}

@available(iOS 17.0, *)
struct SC19Observable: View {
    
    @State var viewModel = SC19ObservableViewModel()
    
    var body: some View {
        Text(viewModel.title)
            .task {
                await viewModel.updateTitle()
            }
    }
}

@available(iOS 17.0, *)
#Preview {
    SC19Observable()
}
