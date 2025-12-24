//
//  BC47IfLetGuard.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/19/23.
//

import SwiftUI

struct BC47IfLetGuard: View {
    
    @State var currentUserID: String? = nil
    @State var displayText: String? = nil
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Practicing Safe Coding")
                
                if let text = displayText {
                    Text(text)
                        .font(.title)
                }
                                
                if isLoading {
                    ProgressView()
                }
                
                Spacer()
            }
            .navigationTitle("Safe Coding")
            .onAppear {
                loadDataGuard()
            }
        }
    }
    
    func loadDataGuard() {
        guard let userID = currentUserID else {
            displayText = "Error no user id"
            return
        }
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This is the new data. User id: \(userID)"
            isLoading = false
        }
    }
}

struct BC47IfLetGuard_Previews: PreviewProvider {
    static var previews: some View {
        BC47IfLetGuard()
    }
}
