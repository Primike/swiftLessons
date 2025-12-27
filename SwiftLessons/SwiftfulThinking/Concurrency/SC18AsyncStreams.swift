//
//  SC18AsyncStreams.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 12/26/25.
//

import SwiftUI

final class SC18AsyncStreamDataManager: Sendable {
    
    func getAsyncStream() -> AsyncThrowingStream<Int, Error> {
        AsyncThrowingStream { continuation in
            self.getFakeData { value in
                continuation.yield(value)
            } onFinish: { error in
                continuation.finish(throwing: error)
            }
        }
    }
    
    func getFakeData(
        newValue: @escaping @Sendable (_ value: Int) -> Void,
        onFinish: @escaping @Sendable (_ error: Error?) -> Void) {
        let items = [1,2,3,4,5,6,7,8,9,10]
        
        for item in items {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(item)) {
                newValue(item)
                
                if item == items.last {
                    onFinish(nil)
                }
            }
        }
    }
}

@MainActor
class SC18AsyncStreamsViewModel: ObservableObject {

    let manager = SC18AsyncStreamDataManager()
    @Published private(set) var currentNumber: Int = 0
    
    /// Canceling task will not cancel the dispatch publisher stream
    func onViewAppear() {
        Task {
            do {
                for try await value in manager.getAsyncStream().dropFirst(2) {
                    currentNumber = value
                }
            } catch {
                print(error)
            }
        }
    }
}

struct SC18AsyncStreams: View {
    
    @StateObject var viewModel = SC18AsyncStreamsViewModel()
    
    var body: some View {
        Text("\(viewModel.currentNumber)")
            .onAppear {
                viewModel.onViewAppear()
            }
    }
}

#Preview {
    SC18AsyncStreams()
}
