//
//  SC6TaskGroup.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/7/23.
//

import SwiftUI

class SC6DataManager {
    
    func fetchImageWithAsync() async throws -> [UIImage] {
        async let fetchImage1 = fetchImage(url: "https://picsum.photos/1000")
        async let fetchImage2 = fetchImage(url: "https://picsum.photos/1000")
        async let fetchImage3 = fetchImage(url: "https://picsum.photos/1000")
        async let fetchImage4 = fetchImage(url: "https://picsum.photos/1000")
        
        let (image1, image2, image3, image4) = await (try fetchImage1, try fetchImage2, try fetchImage3, try fetchImage4)

        return [image1, image2, image3, image4]
    }
    
    func fetchImageWithTaskGroup() async throws -> [UIImage] {
        let urlStrings = [
            "https://picsum.photos/1000",
            "https://picsum.photos/1000",
            "https://picsum.photos/1000",
            "https://picsum.photos/1000"
        ]
        
        return try await withThrowingTaskGroup(of: UIImage?.self) { group in
            var images: [UIImage] = []
            images.reserveCapacity(urlStrings.count)
            
            //If one try fails all fails if not optional
            for urlString in urlStrings {
                group.addTask {
                    try? await self.fetchImage(url: urlString)
                }
            }

            for try await image in group {
                if let image = image {
                    images.append(image)
                }
            }
            
            return images
        }
    }
    
    private func fetchImage(url: String) async throws -> UIImage {
        guard let url = URL(string: url) else {
            throw URLError(.badURL)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let image = UIImage(data: data) {
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch {
            throw error
        }
    }
}

class SC6TaskGroupViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    let dataManager = SC6DataManager()
    
    func getImages() async {
        if let images = try? await dataManager.fetchImageWithAsync() {
            self.images.append(contentsOf: images)
        }
    }
}

struct SC6TaskGroup: View {
    @StateObject private var viewModel = SC6TaskGroupViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle("Task Group")
            .task {
                await viewModel.getImages()
            }
        }
    }
}

struct SC6TaskGroup_Previews: PreviewProvider {
    static var previews: some View {
        SC6TaskGroup()
    }
}
