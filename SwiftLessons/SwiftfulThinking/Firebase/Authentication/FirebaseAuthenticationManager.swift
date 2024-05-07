//
//  FirebaseAuthenticationManager.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 4/28/24.
//

import Foundation
import FirebaseAuth

struct FirebaseAuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class FirebaseAuthenticationManager {
    
    static let shared = FirebaseAuthenticationManager()
    
    private init() {}
    
    // sdk stores auth info locally
    func getAuthenticatedUser() throws -> FirebaseAuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return FirebaseAuthDataResultModel(user: user)
    }
    
    @discardableResult
    func createUser(email: String, password: String) async throws -> FirebaseAuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return FirebaseAuthDataResultModel(user: authDataResult.user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
