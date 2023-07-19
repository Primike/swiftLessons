//
//  SC3AsyncAwait.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/6/23.
//

import SwiftUI

class SC3AsyncAwaitViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func addTitle1() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.dataArray.append("Title1: \(Thread.current)")
        }
    }
    
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
    
    //Using async func the system decides on the thread
    //Code will run in order on different threads
    func addAuthor1() async {
        let author1 = "Before Await: \(Thread.current)"
        
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        await MainActor.run(body: {
            self.dataArray.append(author1)

            let author2 = "Inside Actor: \(Thread.current)"
            self.dataArray.append(author2)
        })
        
        let author3 = "After Await: \(Thread.current)"
        self.dataArray.append(author3)
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
        .onAppear {
            Task {
                //Code runs in order
                await viewModel.addAuthor1()
                
                viewModel.addTitle1()
                viewModel.addTitle2()
            }

        }
    }
}

struct SC3AsyncAwait_Previews: PreviewProvider {
    static var previews: some View {
        SC3AsyncAwait()
    }
}
