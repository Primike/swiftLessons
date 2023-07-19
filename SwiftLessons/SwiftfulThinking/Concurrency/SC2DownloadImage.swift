//
//  SC2DownloadImage.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/6/23.
//

import SwiftUI
import Combine

class SC2DataManager {
    let url = URL(string: "https://picsum.photos/200")!
    
    func handleResponse(data: Data?, response: URLResponse?) -> UIImage? {
        guard let data = data, let image = UIImage(data: data) else {
            return nil
        }
        
        return image
    }
    
    func downloadWithEscaping(completion: @escaping (_ image: UIImage?, _ error: Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            let image = self?.handleResponse(data: data, response: response)
            
            completion(image, error)
        }
        .resume()
    }
    
    func downloadWithCombine() -> AnyPublisher<UIImage?, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(handleResponse)
            .mapError({ $0 })
            .eraseToAnyPublisher()
    }
    
    func downloadWithAsync() async throws -> UIImage? {
        do {
            let (data, response) = try await URLSession.shared.data(from: url, delegate: nil)
            return handleResponse(data: data, response: response)
        } catch {
            throw error
        }
    }
}

class SC2DownloadImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let dataManager = SC2DataManager()
    var cancellables = Set<AnyCancellable>()
    
    func fetchImage() {
        dataManager.downloadWithEscaping { [weak self] image, error in
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
    
    func fetchCombine() {
        dataManager.downloadWithCombine()
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] image in
                self?.image = image
            }
            .store(in: &cancellables)
    }
    
    func fetchAsync() async {
        let image = try? await dataManager.downloadWithAsync()
        
        await MainActor.run(body: {
            self.image = image
        })
    }
}


struct SC2DownloadImage: View {
    @StateObject private var viewModel = SC2DownloadImageViewModel()
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchAsync()
            }
        }
    }
}

struct SC2DownloadImage_Previews: PreviewProvider {
    static var previews: some View {
        SC2DownloadImage()
    }
}
