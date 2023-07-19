//
//  CL12Hashable.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/4/23.
//

import SwiftUI

//struct CL12CustomModel: Identifiable {
//    let id = UUID().uuidString
//    let title: String
//}

struct CL12CustomModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct CL12Hashable: View {
    
    let data: [CL12CustomModel] = [
        CL12CustomModel(title: "One"),
        CL12CustomModel(title: "Two"),
        CL12CustomModel(title: "Three"),
        CL12CustomModel(title: "Four"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text(item.hashValue.description)
                        .font(.headline)
                }
//                ForEach(data) { item in
//                    Text(item.title)
//                        .font(.headline)
//                }
            }
        }
    }
}

struct CL12Hashable_Previews: PreviewProvider {
    static var previews: some View {
        CL12Hashable()
    }
}
