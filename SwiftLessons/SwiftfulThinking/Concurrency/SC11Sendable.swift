//
//  SC11Sendable.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/10/23.
//

import SwiftUI

actor SC11DataManager {
    func updateDatabase(userInfo: SC11MyClassUserInfo) {
        
    }
}

//Sendable indicates object can be used in concurrent code
//Classes not thread safe if mutable variables
//Have to use a lock if sending mutable class
final class SC11MyClassUserInfo: @unchecked Sendable {
    private var name: String
    let lock = DispatchQueue(label: "queue")
    
    init(name: String) {
        self.name = name
    }
    
    func updateName(name: String) {
        lock.async {
            self.name = name
        }
    }
}

class SC11SendableViewModel: ObservableObject {
    let dataManager = SC11DataManager()
    
    func updateCurrentUserInfo() async {
        let info = SC11MyClassUserInfo(name: "info")
        await dataManager.updateDatabase(userInfo: info)
    }
}

struct SC11Sendable: View {
    @StateObject private var viewModel = SC11SendableViewModel()
    
    var body: some View {
        Text("Hello, World!")
            .task {
                
            }
    }
}

struct SC11Sendable_Previews: PreviewProvider {
    static var previews: some View {
        SC11Sendable()
    }
}
