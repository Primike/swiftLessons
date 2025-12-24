//
//  BC50StateObservableObject.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/19/23.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

@MainActor
class FruitViewModel: ObservableObject {
    
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    func getFruits() async {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Banana", count: 2)
        let fruit3 = FruitModel(name: "Watermelon", count: 88)
        
        isLoading = true
        
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        
        fruitArray = [fruit1, fruit2, fruit3]
        isLoading = false
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}

struct BC50StateObservableObject: View {
    
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()

    
    var body: some View {
        NavigationView {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .navigationBarItems(
                trailing: NavigationLink(destination: BC50SecondScreen(fruitViewModel: fruitViewModel), label: {
                    Image(systemName: "arrow.right")
                        .font(.largeTitle)
                })
            )
        }
        .task {
            await fruitViewModel.getFruits()
        }
    }
}

struct BC50SecondScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
        }
    }
}

struct BC50StateObservableObject_Previews: PreviewProvider {
    static var previews: some View {
        BC50StateObservableObject()
    }
}
