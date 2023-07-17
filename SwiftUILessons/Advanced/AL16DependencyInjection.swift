//
//  AL16DependencyInjection.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/16/23.
//

import SwiftUI
import Combine

struct AL16PostsModel: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

protocol AL16DataServiceProtocol {
    func getData() -> AnyPublisher<[AL16PostsModel], Error>
}

class AL16ProductionDataService: AL16DataServiceProtocol {
        
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[AL16PostsModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [AL16PostsModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class AL16MockDataService: AL16DataServiceProtocol {
    
    let testData: [AL16PostsModel] = [
        AL16PostsModel(userId: 1, id: 1, title: "One", body: "One"),
        AL16PostsModel(userId: 2, id: 2, title: "Two", body: "Two")
    ]
    
    func getData() -> AnyPublisher<[AL16PostsModel], Error> {
        Just(testData)
            .tryMap({ $0 })
            .eraseToAnyPublisher()
    }
}

class Provider {
    
    //Provider used for many dependencies
    let dataService: AL16DataServiceProtocol
    
    init(dataService: AL16DataServiceProtocol) {
        self.dataService = dataService
    }
}

class AL16DependencyInjectionViewModel: ObservableObject {
    
    @Published var dataArray: [AL16PostsModel] = []
    var cancellables = Set<AnyCancellable>()
    let dataService: AL16DataServiceProtocol
    
    init(dataService: AL16DataServiceProtocol) {
        self.dataService = dataService
        loadPosts()
    }
    
    private func loadPosts() {
        dataService.getData()
            .sink { _ in
                
            } receiveValue: { [weak self] posts in
                self?.dataArray = posts
            }
            .store(in: &cancellables)

    }
}

struct AL16DependencyInjection: View {
    
    @StateObject private var viewModel: AL16DependencyInjectionViewModel
    
    init(dataService: AL16DataServiceProtocol) {
        _viewModel = StateObject(wrappedValue: AL16DependencyInjectionViewModel(dataService: dataService))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}

struct AL16DependencyInjection_Previews: PreviewProvider {
    static var previews: some View {
        AL16DependencyInjection(dataService: AL16ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!))
    }
}
