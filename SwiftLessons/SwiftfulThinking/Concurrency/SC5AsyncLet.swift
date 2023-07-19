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
        NavigationView {
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
                        
                        //Appear one by one
//                        let image1 = try await fetchImage()
//                        self.images.append(image1)
//
//                        let image2 = try await fetchImage()
//                        self.images.append(image2)
//
//                        let image3 = try await fetchImage()
//                        self.images.append(image3)
//
//                        let image4 = try await fetchImage()
//                        self.images.append(image4)
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
