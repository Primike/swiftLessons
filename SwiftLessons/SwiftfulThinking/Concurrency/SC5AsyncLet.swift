//
//  SC5AsyncLet.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/6/23.
//

import SwiftUI

struct SC5AsyncLet: View {
    
    @State private var images: [UIImage] = []
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let url = URL(string: "https://picsum.photos/1000")!
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .toolbarBackground(.white, for: .navigationBar)
            .navigationTitle("Async")
            .onAppear {
                Task {
                    do {
                        //All 4 appear at the same time
                        async let fetchImage1 = fetchImage()
                        async let fetchImage2 = fetchImage()
                        async let fetchImage3 = fetchImage()
                        async let fetchImage4 = fetchImage()

                        let (image1, image2, image3, image4) = await (try fetchImage1, try fetchImage2, try fetchImage3, try fetchImage4)
                        
                        self.images.append(contentsOf: [image1, image2, image3, image4])
                        
                        try? await Task.sleep(nanoseconds: 1_000_000_000)
                        
                        // Appear one by one
                        let image5 = try await fetchImage()
                        self.images.append(image5)

                        let image6 = try await fetchImage()
                        self.images.append(image6)

                        let image7 = try await fetchImage()
                        self.images.append(image7)

                        let image8 = try await fetchImage()
                        self.images.append(image8)
                    } catch {
                        
                    }
                }
            }
        }
    }
    
    func fetchImage() async throws -> UIImage {
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

struct SC5AsyncLet_Previews: PreviewProvider {
    static var previews: some View {
        SC5AsyncLet()
    }
}
