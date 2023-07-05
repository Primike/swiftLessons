//
//  CL13SortFilterMap.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/4/23.
//

import SwiftUI

struct CL13UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class CL13ArrayModificationViewModel: ObservableObject {
    @Published var dataArray: [CL13UserModel] = []
    @Published var filteredArray: [CL13UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        //removes any nil values
        mappedArray = dataArray.compactMap({ $0.name })
        
//        mappedArray = dataArray.map({ $0.name })
        
//        filteredArray = dataArray.filter({ $0.points > 3 })
        
//        filteredArray = dataArray.sorted { $0.points > $1.points }
    }
    
    func getUsers() {
        let user1 = CL13UserModel(name: "Doge", points: 5, isVerified: true)
        let user2 = CL13UserModel(name: "Chungus", points: 3, isVerified: true)
        let user3 = CL13UserModel(name: "Prince", points: 7, isVerified: true)
        let user4 = CL13UserModel(name: nil, points: 7, isVerified: true)
        
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
        ])
    }
}

struct CL13SortFilterMap: View {
    @StateObject var viewModel = CL13ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(viewModel.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
//                ForEach(viewModel.filteredArray) { user in
//                    VStack {
//                        Text(user.name)
//
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

struct CL13SortFilterMap_Previews: PreviewProvider {
    static var previews: some View {
        CL13SortFilterMap()
    }
}
