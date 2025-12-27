//
//  SC16Searchable.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 12/26/25.
//

import SwiftUI
import Combine

struct SC16Restaurant: Identifiable, Hashable {
    let id: String
    let title: String
    let cuisine: SC16CuisineOption
}

enum SC16CuisineOption: String {
    case american, italian, japanese
}

final class SC16RestaurantManager: Sendable {
    func getAllRestaurants() async throws -> [SC16Restaurant] {
        return [
            SC16Restaurant(id: "1", title: "Burger Shack", cuisine: .american),
            SC16Restaurant(id: "2", title: "Pasta Palace", cuisine: .italian),
            SC16Restaurant(id: "3", title: "Sushi Heaven", cuisine: .japanese),
            SC16Restaurant(id: "4", title: "Local Market", cuisine: .american)
        ]
    }
}

@MainActor
final class SC16SearchableViewModel: ObservableObject {
    
    @Published private(set) var allRestaurants: [SC16Restaurant] = []
    @Published private(set) var filteredRestaurants: [SC16Restaurant] = []
    @Published var searchText: String = ""
    @Published var searchScope: SearchScopeOption = .all
    @Published private(set) var allSearchScopes: [SearchScopeOption] = []
    
    let manager = SC16RestaurantManager()
    private var cancellables = Set<AnyCancellable>()
    
    var isSearching: Bool {
        !searchText.isEmpty
    }
    
    var showSearchSuggestions: Bool {
        searchText.count < 5
    }
    
    enum SearchScopeOption: Hashable {
        case all
        case cuisine(option: SC16CuisineOption)
        
        var title: String {
            switch self {
            case .all:
                return "All"
            case .cuisine(option: let option):
                return option.rawValue.capitalized
            }
        }
    }
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        $searchText
            .combineLatest($searchScope)
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] (searchText, searchScope) in
                self?.filterRestaurants(searchText: searchText, currentSearchScope: searchScope)
            }
            .store(in: &cancellables)
    }
    
    private func filterRestaurants(searchText: String, currentSearchScope: SearchScopeOption) {
        guard !searchText.isEmpty else {
            filteredRestaurants = []
            searchScope = .all
            return
        }
        
        var restaurantsInScope = allRestaurants
        
        switch currentSearchScope {
        case .all:
            break
        case .cuisine(option: let option):
            restaurantsInScope = allRestaurants.filter({ $0.cuisine == option })
        }
        
        let search = searchText.lowercased()
        filteredRestaurants = restaurantsInScope.filter({ restaurant in
            let titleContainsSearch = restaurant.title.lowercased().contains(search)
            let cuisineContainsSearch = restaurant.cuisine.rawValue.lowercased().contains(search)
            return titleContainsSearch || cuisineContainsSearch
        })
    }
    
    func loadRestaurants() async {
        do {
            allRestaurants = try await manager.getAllRestaurants()
            
            let allCuisines = Set(allRestaurants.map { $0.cuisine })
            allSearchScopes = [.all] + allCuisines.map({ SearchScopeOption.cuisine(option: $0) })
        } catch {
            print(error)
        }
    }
    
    func getSearchSuggestions() -> [String] {
        guard showSearchSuggestions else {
            return []
        }
        
        var suggestions: [String] = []
        
        let search = searchText.lowercased()
        
        if search.contains("pa") { suggestions.append("Pasta") }
        if search.contains("su") { suggestions.append("Sushi") }
        if search.contains("bu") { suggestions.append("Burger") }
        
        suggestions.append("Market")
        suggestions.append("Grocery")
        suggestions.append(SC16CuisineOption.italian.rawValue.capitalized)
        suggestions.append(SC16CuisineOption.japanese.rawValue.capitalized)
        suggestions.append(SC16CuisineOption.american.rawValue.capitalized)
        
        return suggestions
    }
    
    func getRestaurantSuggestions() -> [SC16Restaurant] {
        guard showSearchSuggestions else {
            return []
        }
        
        var suggestions: [SC16Restaurant] = []
        let search = searchText.lowercased()
        
        if search.contains("ita") {
            suggestions.append(contentsOf: allRestaurants.filter({ $0.cuisine == .italian }))
        }
        
        if search.contains("jap") {
            suggestions.append(contentsOf: allRestaurants.filter({ $0.cuisine == .japanese }))
        }

        return suggestions
    }
}

struct SC16Searchable: View {
    
    @StateObject var viewModel = SC16SearchableViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(viewModel.isSearching ? viewModel.filteredRestaurants : viewModel.allRestaurants) { restaurant in
                    NavigationLink(value: restaurant) {
                        restaurantRow(restaurant: restaurant)
                    }
                }
                
                Text("ViewModel is searching \(viewModel.isSearching.description)")
                
                SC16SearchChildView()
            }
            .padding()
        }
        .navigationTitle("Restaurants")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.white, for: .automatic)
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Search restaurants..."))
        .searchScopes($viewModel.searchScope, scopes: {
            ForEach(viewModel.allSearchScopes, id: \.self) { scope in
                Text(scope.title)
                    .tag(scope)
            }
        })
        .searchSuggestions({
            ForEach(viewModel.getSearchSuggestions(), id: \.self) { suggestion in
                Text(suggestion)
                    .searchCompletion(suggestion)
            }
            
            ForEach(viewModel.getRestaurantSuggestions(), id: \.self) { suggestion in
                NavigationLink(value: suggestion) {
                    Text(suggestion.title)
                }
            }
        })
        .task {
            await viewModel.loadRestaurants()
        }
        .navigationDestination(for: SC16Restaurant.self) { restaurant in
            Text(restaurant.title.uppercased())
        }
    }
    
    func restaurantRow(restaurant: SC16Restaurant) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(restaurant.title)
                .font(.headline)
                .foregroundStyle(.red)
            
            Text(restaurant.cuisine.rawValue.capitalized)
                .font(.caption)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.black.opacity(0.05))
        .tint(.primary)
    }
}

struct SC16SearchChildView: View {
    
    @Environment(\.isSearching) private var isSearching
    
    var body: some View {
        Text("Child View is searching \(isSearching.description)")
    }
}

#Preview {
    NavigationStack {
        SC16Searchable()
    }
}
