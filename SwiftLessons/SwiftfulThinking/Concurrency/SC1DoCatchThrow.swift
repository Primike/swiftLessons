//
//  SC1DoCatchThrow.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/6/23.
//

import SwiftUI

class SC1DataManager {
    let isActive: Bool = true
    
    func getTitle() -> (title: String?, error: Error?) {
        if isActive {
            return ("New Text", nil)
        } else {
            return (nil, URLError(.badURL))
        }
    }
    
    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("New Text")
        } else {
            return .failure(URLError(.appTransportSecurityRequiresSecureConnection))
        }
    }
    
    func getTitle3() throws -> String {
        if isActive {
            return "New Text"
        } else {
            throw URLError(.badServerResponse)
        }
    }
}

class SC1DoCatchThrowViewModel: ObservableObject {
    @Published var text: String = "Text"
    let dataManager = SC1DataManager()
    
    func fetchTitle() {
        let returnedValue = dataManager.getTitle()
        
        if let newTitle = returnedValue.title {
            self.text = newTitle
        } else if let error = returnedValue.error {
            self.text = error.localizedDescription
        }
    }
    
    func fetchTitle2() {
        let result = dataManager.getTitle2()
        
        switch result {
        case .success(let newTitle):
            self.text = newTitle
        case .failure(let error):
            self.text = error.localizedDescription
        }
    }
    
    func fetchTitle3() {
//        let newTitle = try? dataManager.getTitle3()
//        self.text = newTitle ?? ""
        
        //If one non optional try fails catch will be run
        do {
            let newTitle = try dataManager.getTitle3()
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
