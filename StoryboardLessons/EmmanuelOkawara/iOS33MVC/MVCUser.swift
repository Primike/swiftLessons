//
//  MVCUser.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 5/16/23.
//

import Foundation

struct MVCUser {
    let firstName, lastName, email: String
    let age: Int
    let location: MVCLocation
}

struct MVCLocation {
    let latitude: Double
    let longitude: Double
}
