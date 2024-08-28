//
//  AL19AdvancedCombine.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 8/26/24.
//

import SwiftUI
import Combine

class AL19AdvancedCombineDataService {
    
//    @Published var basicPublisher: String = "first publish"
//    let currentValuePublisher = CurrentValueSubject<String, Never>("first publish")
    // This one does not hold the data it passes
    let passThroughPublisher = PassthroughSubject<Int, Error>()
    
    init() {
        publishFakeData()
    }
    
    private func publishFakeData() {
//        let items = ["one", "two", "three"]
        let items: [Int] = Array(0..<11)
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.passThroughPublisher.send(items[x])
                
                // For last() to work, sends when reaches last
                if x == items.indices.last {
                    self.passThroughPublisher.send(completion: .finished)
                }
                
//                self.currentValuePublisher.send(items[x])
//                self.basicPublisher = items[x]
            }
        }
    }
}

class AL19AdvancedCombineViewModel: ObservableObject {
    
    @Published var data: [String] = []
    @Published var error: String = ""
    let dataService = AL19AdvancedCombineDataService()
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.passThroughPublisher
        // Sequence Operations
        /*
//            .first(where: { $0 > 4 })
//            .tryFirst(where: { int in
//                if int == 3 { throw URLError(.badServerResponse) }
//                
//                return int > 4
//            })
//            .last(where: { $0 < 4 })
//            .tryLast(where: { int in
//                if int == 3 { throw URLError(.badServerResponse) }
//
//                return int > 1
//            })
//            .drop(while: { $0 < 5 })
//            .prefix(4)
//            .output(in: 2..<4)
         */
        
        // Mathematic Operations
        /*
//            .max(by: { $0 < $1 })
//            .tryMin(by: { int1, int2 in
//                if int2 == int1 { throw URLError(.badURL) }
//                return int1 < int2
//            })
         */
        
        // Filter/Reduce
        /*
//            .tryMap({ int in
//                if int == 5 { throw URLError(.badURL) }
//                return String(int)
//            })
//            .compactMap({ int in
//                if int == 5 { return nil }
//                return String(int)
//            })
//            .filter({ $0 % 2 == 0 })
//            .removeDuplicates(by: { $0 == $1 })
//            .replaceError(with: 0)
//            .scan(0, { $0 + $1 })
//            .collect(3)
        */
        
        // Timing Operations
//            .debounce(for: 1.1, scheduler: DispatchQueue.main)
//            .delay(for: 2, scheduler: DispatchQueue.main)
            .map({ String($0)} )
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "ERROR: \(error)"
                }
            } receiveValue: { [weak self] returnedValue in
//                self?.data.append(contentsOf: returnedValue)
                self?.data.append(returnedValue)
            }
            .store(in: &cancellables)

    }
}

struct AL19AdvancedCombine: View {
    
    @StateObject private var viewModel = AL19AdvancedCombineViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.data, id: \.self) {
                    Text($0)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                if !viewModel.error.isEmpty {
                    Text(viewModel.error)
                }
            }
        }
    }
}

#Preview {
    AL19AdvancedCombine()
}
