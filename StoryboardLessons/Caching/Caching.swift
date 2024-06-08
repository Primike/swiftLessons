//
//  Caching.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 6/30/23.
//

import Foundation

protocol Caching {
    func set(value: Data, for key: String)
    func get(key: String) -> Data?
}

class CacheService: Caching {
    private var cache: [String: Data] = [:]
    private var keys: [String] = []
    private let capacity: Int
    private let queue = DispatchQueue(label: "com.yourapp.cacheservice", attributes: .concurrent)

    static let shared = CacheService(capacity: 10)
    
    private init(capacity: Int) {
        self.capacity = capacity
    }

    func set(value: Data, for key: String) {
        queue.async(flags: .barrier) {
            if self.keys.count >= self.capacity, let keyToRemove = self.keys.first {
                self.cache.removeValue(forKey: keyToRemove)
                self.keys.removeFirst()
            }
            
            self.cache[key] = value
            self.keys.append(key)
        }
    }

    func get(key: String) -> Data? {
        queue.sync {
            guard let data = cache[key] else {
                return nil
            }
            
            // Remove key and re-append it to mark it as recently used
            if let index = keys.firstIndex(of: key) {
                keys.remove(at: index)
                keys.append(key)
            }
            
            return data
        }
    }
}
