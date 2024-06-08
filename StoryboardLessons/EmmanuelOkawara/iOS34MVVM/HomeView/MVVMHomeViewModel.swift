//
//  MVVMHomeViewModel.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 5/16/23.
//

import Foundation

final class MVVMHomeViewModel {
    
//    @Published var welcomeMessage: String?
    var welcomeMessage: MVVMObservableObject<String?> = MVVMObservableObject(nil)
    
    func getLoggedInUser() {
        let user = MVVMNetworkService.shared.getLoggedInUser()
        self.welcomeMessage.value = "Hello \(user.firstName) \(user.lastName)"
    }
}
