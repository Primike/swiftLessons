//
//  MVVMLoginViewModel.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 5/16/23.
//

import Foundation

final class MVVMLoginViewModel {
    
    var error: MVVMObservableObject<String?> = MVVMObservableObject(nil)
    
    func login(email: String, password: String) {
        MVVMNetworkService.shared.login(email: email, password: password) { [weak self] success in
            self?.error.value = success ? nil : "Invalid Credentials!!!"
        }
    }
}
