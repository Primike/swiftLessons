//
//  SC1DoCatchThrow.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/6/23.
//

import SwiftUI

class SC1DataManager {
    
    let isActive: Bool = true
        
    func getTitleWithResult() -> Result<String, Error> {
        if isActive {
            return .success("New Text Result")
        } else {
            return .failure(URLError(.badURL))
        }
    }
    
    func getTitleThrows() throws -> String {
        if isActive {
            return "New Text Throws"
        } else {
            throw URLError(.badURL)
        }
    }
}

class SC1DoCatchThrowViewModel: ObservableObject {
    
    @Published var text: String = "Text"
    let dataManager = SC1DataManager()
        
    func fetchTitle2() {
        let result = dataManager.getTitleWithResult()
        
        switch result {
        case .success(let newTitle):
            self.text = newTitle
        case .failure(let error):
            self.text = error.localizedDescription
        }
    }
    
    func fetchTitle3() {
        do {
            let newTitle = try dataManager.getTitleThrows()
            self.text = newTitle
        } catch {
            self.text = error.localizedDescription
        }
    }
}

struct SC1DoCatchThrow: View {
    @StateObject private var viewModel = SC1DoCatchThrowViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .frame(width: 300, height: 300)
            .background(Color.blue)
            .onTapGesture {
                viewModel.fetchTitle3()
            }
    }
}

struct SC1DoCatchThrow_Previews: PreviewProvider {
    static var previews: some View {
        SC1DoCatchThrow()
    }
}
