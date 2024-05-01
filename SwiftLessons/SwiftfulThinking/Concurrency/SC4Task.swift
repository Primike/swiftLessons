//
//  SC4Task.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/6/23.
//

import SwiftUI

class SC4TaskViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var image2: UIImage? = nil
    
    func fetchImage() async {
        try? await Task.sleep(nanoseconds: 5_000_000_000)
        
        // Incase .task does not fully cancel
        // Used if the function has expensive work
        // throws an error
//        try Task.checkCancellation()
        
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            await MainActor.run(body: {
                self.image = UIImage(data: data)
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchImage2() async {
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            await MainActor.run(body: {
                self.image = UIImage(data: data)
            })
        } catch {
            print(error.localizedDescription)
        }
    }

}

struct SC4TaskHome: View {
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink("Click") {
                    SC4Task()
                }
            }
        }
    }
}

struct SC4Task: View {
    @StateObject private var viewModel = SC4TaskViewModel()
    //Can make non publish in viewmodel
    @State private var fetchImageTask: Task<(), Never>? = nil
    
    var body: some View {
        VStack(spacing: 40) {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200 ,height: 200)
            }
            
            if let image = viewModel.image2 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200 ,height: 200)
            }
        }
        // if view is removed task is canceled
        // used instead of the onDisappear and onAppear
        .task {
            await viewModel.fetchImage()
        }
        .onDisappear{
            fetchImageTask?.cancel()
        }
        .onAppear {
            fetchImageTask = Task {
                await viewModel.fetchImage()
            }
            
            // Assign priority can also yeild
//            Task(priority: .medium) {
//                await Task.yield()
//                print("Medium: \(Task.currentPriority)")
//
//                Task {
//                    print("Inherited: \(Task.currentPriority)")
//                }
//            }
//
//            // Write the code for Tasks in order of priority
//            Task {
//                print("Image: \(Task.currentPriority)")
//                await viewModel.fetchImage()
//            }
//            Task {
//                print("Image: \(Task.currentPriority)")
//                await viewModel.fetchImage2()
//            }
        }
    }
}

struct SC4Task_Previews: PreviewProvider {
    static var previews: some View {
        SC4TaskHome()
    }
}
