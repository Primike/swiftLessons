//
//  CL20Escaping.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/4/23.
//

import SwiftUI

class CL20EscapingViewModel: ObservableObject {
    @Published var text: String = "Doge"
    
    func getData() {
//        downloadData2 { data in
//            text = data
//        }
        
        downloadData3 { [weak self] data in
            guard let self = self else { return }
            
            self.text = data
        }
    }
    
    func downloadData() -> String {
        return "Chungus"
    }
    
    func downloadData2(completion: (_ data: String) -> Void) {
        completion("New data")
    }
    
    func downloadData3(completion: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion("Escaping")
        }
    }
    
    func downloadData4(completion: @escaping CL20DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = CL20DownloadResult(data: "Data")
            completion(result)
        }
    }
}

typealias CL20DownloadCompletion = (CL20DownloadResult) -> Void

struct CL20DownloadResult {
    let data: String
}

struct CL20Escaping: View {
    @StateObject var viewModel = CL20EscapingViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                viewModel.getData()
            }
    }
}

struct CL20Escaping_Previews: PreviewProvider {
    static var previews: some View {
        CL20Escaping()
    }
}
