//
//  SC13StrongWeak.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 12/26/25.
//

import SwiftUI

/// To make thread safe can also make it  struct or an actor
final class SC13StrongSelfDataService: Sendable {
    func getData() async -> String {
        "Updated Data"
    }
}

@MainActor
final class SC13StrongSelfBootcampViewModel: ObservableObject {
    
    @Published var data: String = "Some Title!"
    let dataService = SC13StrongSelfDataService()
    private var someTask: Task<Void, Never>?
    
    func cancelTasks() {
        someTask?.cancel()
        someTask = nil
    }
    
    func updateData() {
        Task {
            data = await dataService.getData()
        }
    }
    
    func updateData2() {
        someTask = Task {
            data = await dataService.getData()
        }
    }
}

struct SC13StrongWeak: View {
    
    @StateObject var viewModel = SC13StrongSelfBootcampViewModel()
    
    var body: some View {
        Text(viewModel.data)
            .onAppear {
                viewModel.updateData()
            }
            .onDisappear {
                viewModel.cancelTasks()
            }
    }
}

#Preview {
    SC13StrongWeak()
}
