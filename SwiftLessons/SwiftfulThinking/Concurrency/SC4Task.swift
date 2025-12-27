//
//  SC4Task.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/6/23.
//

import SwiftUI

struct SC4DataManager {
    func imageTask() async throws -> UIImage? {
        guard let url = URL(string: "https://picsum.photos/200") else {
            return nil
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return UIImage(data: data)
    }
}

@MainActor
class SC4TaskViewModel: ObservableObject {
    
    private let dataManager: SC4DataManager
    @Published var image: UIImage? = nil
    @Published var image2: UIImage? = nil
    @Published var image3: UIImage? = nil
    
    init(dataManager: SC4DataManager = SC4DataManager()) {
        self.dataManager = dataManager
    }
    
    func fetchImage() async {
        guard let image = try? await dataManager.imageTask() else {
            return
        }
        
        self.image = image
    }
    
    func fetchImage2() async {
        guard let image = try? await dataManager.imageTask() else {
            return
        }
        
        self.image2 = image
    }
    
    func fetchImage3() async {
        guard let image = try? await dataManager.imageTask() else {
            return
        }
        
        self.image3 = image
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
    @State private var fetchImageTask: Task<(), Never>? = nil
    
    var body: some View {
        VStack(spacing: 40) {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150 ,height: 150)
            }
            
            if let image = viewModel.image2 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150 ,height: 150)
            }
            
            if let image = viewModel.image3 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150 ,height: 150)
            }
        }
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
            
            Task(priority: .medium) {
                await Task.yield()
                
                print("Medium: \(Task.currentPriority)")

                Task {
                    print("Inherited: \(Task.currentPriority)")
                }
            }

            Task {
                print("Image: \(Task.currentPriority)")
                await viewModel.fetchImage2()
            }
            
            Task {
                print("Image: \(Task.currentPriority)")
                await viewModel.fetchImage3()
            }
        }
    }
}

struct SC4Task_Previews: PreviewProvider {
    static var previews: some View {
        SC4TaskHome()
    }
}
