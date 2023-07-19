//
//  SC12AsyncPublisher.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/10/23.
//

import SwiftUI
import Combine

class SC12DataManager {
    @Published var myData: [String] = []
    
    func addData() async {
        myData.append("Apple")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Orange")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Watermelon")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
    }
}

class SC12AsyncPublisherViewModel: ObservableObject {
    @MainActor @Published var dataArray: [String] = []
    let dataManager = SC12DataManager()
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        Task {
            //Waits forever
            for await value in dataManager.$myData.values {
                await MainActor.run(body: {
                    self.dataArray = value
                })
            }
            
            //Never executes code:
            //print("QWE")
        }
        
        //For other code use another task
        Task {
            print("QWE")
        }
        
//        dataManager.$myData
//            .receive(on: DispatchQueue.main, options: nil)
//            .sink { data in
//                self.dataArray = data
//            }
//            .store(in: &cancellables)
    }
    
    func start() async {
        await dataManager.addData()
    }
}

struct SC12AsyncPublisher: View {
@StateObject private var viewModel = SC12AsyncPublisherViewModel()
    
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
            await viewModel.start()
        }
    }
}

struct SC12AsyncPublisher_Previews: PreviewProvider {
    static var previews: some View {
        SC12AsyncPublisher()
    }
}
