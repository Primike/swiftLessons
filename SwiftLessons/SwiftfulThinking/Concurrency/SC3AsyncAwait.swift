//
//  SC3AsyncAwait.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/6/23.
//

import SwiftUI

@MainActor
class SC3AsyncAwaitViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func addTitle1() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.dataArray.append("Title1: \(Thread.current)")
        }
    }
    
    /// The system owns dispatchqueue so no reference cycle
    /// Closure is deallocated after code runs then ViewModel can be deallocated
    func addTitle2() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let title = "Outside Main: \(Thread.current)"
            
            DispatchQueue.main.async {
                self.dataArray.append(title)
                
                let title2 = "Inside Main: \(Thread.current)"
                self.dataArray.append(title2)
            }
        }
    }
    
    /// All run on main actor
    func addAuthor1() async {
        let author1 = "Before Await: Main Thread"
        
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        self.dataArray.append(author1)
        
        let author2 = "After Await: Main Thread"
        self.dataArray.append(author2)
    }
}

struct SC3AsyncAwait: View {
    @StateObject private var viewModel = SC3AsyncAwaitViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.dataArray, id: \.self) { data in
                Text(data)
            }
        }
        .task {
            await viewModel.addAuthor1()
            
            viewModel.addTitle1()
            viewModel.addTitle2()
        }
    }
}

struct SC3AsyncAwait_Previews: PreviewProvider {
    static var previews: some View {
        SC3AsyncAwait()
    }
}
