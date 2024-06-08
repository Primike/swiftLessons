//
//  MVVMNetworkService.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 5/16/23.
//

import Foundation

class MVVMNetworkService {
    
    static let shared = MVVMNetworkService()
    private var user: MVVMUser?

    private init() {}
    
    func login(email: String, password: String, completion: @escaping(Bool) -> Void) {
        DispatchQueue.global().async {
            sleep(2)
            
            DispatchQueue.main.async { [weak self] in
                if email == "test@test.com" && password == "password" {
                    self?.user = MVVMUser(firstName: "Big", lastName: "Chungus", email: "test@test.com", age: 24)
                    completion(true)
                } else {
                    self?.user = nil
                    completion(false)
                }
            }
        }
    }
    
    func getLoggedInUser() -> MVVMUser {
        return user!
    }
}
