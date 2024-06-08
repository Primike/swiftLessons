//
//  MVVMObservableObject.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 5/16/23.
//

import Foundation

final class MVVMObservableObject<T> {
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    //could be array
    private var listener: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping(T) -> Void) {
        listener(value)
        self.listener = listener
    }
}
