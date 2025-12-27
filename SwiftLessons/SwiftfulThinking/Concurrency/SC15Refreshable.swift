//
//  SC15Refreshable.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 12/26/25.
//

import SwiftUI

final class SC15RefreshableDataService: Sendable {
    func getData() async throws -> [String] {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return ["Apple", "Orange", "Banana"].shuffled()
    }
}

@MainActor
class SC15RefreshableViewModel: ObservableObject {
    
    @Published private(set) var items: [String] = []
    let manager = SC15RefreshableDataService()
    
    func loadData() async {
        do {
            items = try await manager.getData()
        } catch {
            print(error)
        }
    }
}

struct SC15Refreshable: View {
    
    @StateObject var viewModel = SC15RefreshableViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.items, id: \.self) { item in
                        Text(item)
                            .font(.headline)
                    }
                }
            }
            .refreshable {
                await viewModel.loadData()
            }
            .navigationTitle("Refreshable")
            .task {
                await viewModel.loadData()
            }
        }
    }
}
#Preview {
    SC15Refreshable()
}
