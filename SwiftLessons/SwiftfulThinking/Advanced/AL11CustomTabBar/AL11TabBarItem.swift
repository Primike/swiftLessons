//
//  AL11TabBarItem.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/14/23.
//

import Foundation
import SwiftUI

//struct AL11TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum AL11TabBarItem: Hashable {
    case home, favorites, profile, messages
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .favorites: return "heart"
        case .profile: return "person"
        case .messages: return "message"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .favorites: return "Favorites"
        case .profile: return "Profile"
        case .messages: return "Messages"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return .red
        case .favorites: return .blue
        case .profile: return .green
        case .messages: return .orange
        }
    }
}
