//
//  CL17MultiThreading.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/4/23.
//

import SwiftUI

class CL17BackgroundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            
            let newData = self.downloadData()
            
            DispatchQueue.main.async {
                self.dataArray = newData
            }
        }
    }
    
    func downloadData() -> [String] {
        var data: [String] = []
        
        for i in 0..<100 {
            data.append("\(i)")
        }
        
        return data
    }
}

struct CL17MultiThreading: View {
    @StateObject var viewModel = CL17BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        viewModel.fetchData()
                    }
                
                ForEach(viewModel.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct CL17MultiThreading_Previews: PreviewProvider {
    static var previews: some View {
        CL17MultiThreading()
    }
}
