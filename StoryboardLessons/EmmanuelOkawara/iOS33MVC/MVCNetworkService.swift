//
//  MVCNetworkService.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 5/16/23.
//

import Foundation

class MVCNetworkService {
    
    static let shared = MVCNetworkService()
    private var user: MVCUser?

    private init() {}
    
    func login(email: String, password: String, completion: @escaping(Bool) -> Void) {
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                if email == "test@test.com" && password == "password" {
                    self.user = MVCUser(firstName: "Big", lastName: "Chungus", email: "test@test.com", age: 24, location: MVCLocation(latitude: 2.19489, longitude: -6326763))
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
    
    func getLoggedInUser() -> MVCUser {
        return user!
    }
}
