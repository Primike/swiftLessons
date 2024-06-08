//
//  ChungusError.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 2/6/23.
//

import Foundation

enum ChungusError: LocalizedError {
    case invalidEmail(String)
    case invalidPhone
    case invalidName
    
    var errorDescription: String? {
        switch self {
        case .invalidEmail(let email):
            return "Email \(email) is invalid"
        case .invalidPhone:
            return "Please enter a valid phone number of 11 digits"
        case .invalidName:
            return "Please enter at least two names"
        }
    }
}
