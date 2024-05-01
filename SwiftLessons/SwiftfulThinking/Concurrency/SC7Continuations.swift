//
//  SC7Continuations.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/7/23.
//

import SwiftUI

class SC7DataManager {
    
    func getData(url: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw error
        }
    }
    
    func getData2(url: URL) async throws -> Data {
        // Used for functions with are not yet updated with async
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                // Continuation must be called once
                // otherwise there will be a memory leak
                if let data = data {
                    continuation.resume(returning: data)
                } else if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: URLError(.badURL))
                }
            }
            .resume()
        }
    }
    
    func getHeartImageFromDatabase(completion: @escaping (_ image: UIImage) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            completion(UIImage(systemName: "heart.fill")!)
        }
    }
    
    func getHeartImageAsync() async -> UIImage {
        await withCheckedContinuation({ continuation in
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                continuation.resume(returning: UIImage(systemName: "heart.fill")!)
            }
        })
    }
}

class SC7ContinuationsViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let dataManager = SC7DataManager()
    
    func getImage() async {
        guard let url = URL(string: "https://picsum.photos/300") else { return }
        
        do {
            let data = try await dataManager.getData2(url: url)
            
            if let image = UIImage(data: data) {
                await MainActor.run(body: {
                    self.image = image
                })
            }

        } catch {
            print(error)
        }
    }
    
    func getHeartImage() async {
        self.image = await dataManager.getHeartImageAsync()
    }
}

struct SC7Continuations: View {
    @StateObject private var viewModel = SC7ContinuationsViewModel()
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
            await viewModel.getHeartImage()
        }
    }
}

struct SC7Continuations_Previews: PreviewProvider {
    static var previews: some View {
        SC7Continuations()
    }
}
