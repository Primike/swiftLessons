//
//  SC7Continuations.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/7/23.
//

import SwiftUI

struct SC7DataManager {
    
    func getData(url: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw error
        }
    }
    
    func getData2(url: URL) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                // Continuation must be called only once
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
    
    private func getHeartImageFromDatabase(completion: @escaping @Sendable (_ image: UIImage) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(UIImage(systemName: "heart.fill") ?? UIImage())
        }
    }
    
    func getHeartImageAsync() async -> UIImage {
        await withCheckedContinuation({ continuation in
            getHeartImageFromDatabase { image in
                continuation.resume(returning: image)
            }
        })
    }
}

@MainActor
class SC7ContinuationsViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let dataManager = SC7DataManager()
    
    func getImage() async {
        guard let url = URL(string: "https://picsum.photos/300") else { return }
        
        do {
            let data = try await dataManager.getData2(url: url)
            
            self.image = UIImage(data: data)

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
