//
//  SC10GlobalActors.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/9/23.
//

import SwiftUI

@globalActor final class SC10GlobalActor {
    static var shared = SC10DataManager()
}

actor SC10DataManager {
    
    func getDataFromDatabase() -> [String] {
        return ["One", "Two", "Three"]
    }
}

@MainActor class SC10GlobalActorsViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    let dataManager = SC10GlobalActor.shared
    
    @SC10GlobalActor func getData() {
        Task {
            let data = await dataManager.getDataFromDatabase()
            await MainActor.run(body: {
                self.dataArray = data
            })
        }
    }
}

struct SC10GlobalActors: View {
    @StateObject private var viewModel = SC10GlobalActorsViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.dataArray, id: \.self) {
                    Text($0)
                        .font(.headline)
                }
            }
        }
        .task {
            await viewModel.getData()
        }
    }
}

struct SC10GlobalActors_Previews: PreviewProvider {
    static var previews: some View {
        SC10GlobalActors()
    }
}
