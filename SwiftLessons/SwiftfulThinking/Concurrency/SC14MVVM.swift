//
//  SC14MVVM.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 12/26/25.
//

import SwiftUI

final class SC14MyManagerClass: Sendable {
    func getData() async throws -> String {
        "Some Data!"
    }
}

actor SC14SomeActor {
    func getData() async throws -> String {
        "Some Data!"
    }
}

@MainActor
final class SC14MVVMViewModel: ObservableObject {
    
    let managerClass = SC14MyManagerClass()
    let managerActor = SC14SomeActor()
    @Published private(set) var myData: String = "Starting Text"
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
    func onCallToActionButtonPressed() {
        let task = Task {
            do {
                myData = try await managerClass.getData()
            } catch {
                print(error)
            }
        }
        
        tasks.append(task)
    }
}

struct SC14MVVM: View {
    
    @StateObject var viewModel = SC14MVVMViewModel()
    
    var body: some View {
        Button(viewModel.myData) {
            viewModel.onCallToActionButtonPressed()
        }
        .onDisappear {
            viewModel.cancelTasks()
        }
    }
}

#Preview {
    SC14MVVM()
}
