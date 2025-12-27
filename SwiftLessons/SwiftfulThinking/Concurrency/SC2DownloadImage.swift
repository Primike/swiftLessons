//
//  SC2DownloadImage.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/6/23.
//

import SwiftUI
import Combine

struct SC2DataManager {
    
    let url = URL(string: "https://picsum.photos/200")!
    
    func handleResponse(data: Data?, response: URLResponse?) -> UIImage? {
        guard let data = data, let image = UIImage(data: data) else {
            return nil
        }
        
        return image
    }
    
    /// Closure and its contents passed in must be sendable
    func downloadWithEscaping(completion: @escaping @Sendable (_ image: UIImage?, _ error: Error?) -> ()) {
        
        /// Data manager is sendable so it can be sent to the dataTask
        URLSession.shared.dataTask(with: url) { data, response, error in
            let image = handleResponse(data: data, response: response)
            
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

/// All the ViewModel's properties can only be read and modified on the main actor
@MainActor
class SC2DownloadImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let dataManager = SC2DataManager()
    var cancellables = Set<AnyCancellable>()
    
    func fetchImage() {
        dataManager.downloadWithEscaping { [weak self] image, error in
            guard let self else { return }
            
            Task { @MainActor in
                self.image = image
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
    
    /// Always runs on main actor because class and its properties run on main actor
    func fetchAsync() async {
        image = try? await dataManager.downloadWithAsync()
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
        .task {
            await viewModel.fetchAsync()
        }
    }
}

struct SC2DownloadImage_Previews: PreviewProvider {
    static var previews: some View {
        SC2DownloadImage()
    }
}
