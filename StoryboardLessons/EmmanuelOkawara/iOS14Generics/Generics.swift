//
//  Generics.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 2/1/23.
//

import Foundation

class GenericsLesson {
    static func sum<T: AdditiveArithmetic>(num1: T, num2: T) -> T {
        return num1 + num2
    }
}

struct Cart<Item> {
    let items: [Item]
}

var genericsLesson = Cart<Int>(items: [1,2,3])
