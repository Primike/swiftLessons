//
//  AL8Generics.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/11/23.
//

import SwiftUI

struct AL8StringModel<T> {
    
    let info: T?
    
    func removeInfo() ->AL8StringModel {
        AL8StringModel(info: nil)
    }
}

class AL8GenericsViewModel: ObservableObject {
    
    @Published var stringModel = AL8StringModel(info: "Hello")
    
    func removeData() {
        stringModel = stringModel.removeInfo()
    }
}

struct AL8GenericView<T: View>: View {
    
    let content: T
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
            content
        }
    }
}

struct AL8Generics: View {
    
    @StateObject private var viewModel = AL8GenericsViewModel()
    
    var body: some View {
        VStack {
            AL8GenericView(content: Text("Generic view"), title: "Doge")
            
            Text(viewModel.stringModel.info ?? "No data")
                .onTapGesture {
                    viewModel.removeData()
                }
        }
    }
}

struct AL8Generics_Previews: PreviewProvider {
    static var previews: some View {
        AL8Generics()
    }
}
