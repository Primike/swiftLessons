//
//  SwiftConcurrency.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 5/12/24.
//

import Foundation

class SwiftConcurrency {
    
    static func download() async -> String {
        return "Data"
    }
    
    // Runs the tasks one at a time
    static func oneAtATime() async {
        let data1 = await download()
        let data2 = await download()
    }
    
    // Runs tasks in parallel on different threads
    static func inParallel() async -> [String] {
        async let data1 = download()
        async let data2 = download()
        
        let data = await [data1, data2]
        return data
    }
    
    static func getData() async {
        let data = await withTaskGroup(of: Optional<String>.self) { group -> [String] in
            let strings = await inParallel()
            
            for name in strings {
                let taskHandle = group.addTaskUnlessCancelled {
                    guard !Task.isCancelled else { return nil }
                    return await download()
                }
            }

            var result = [String]()
            
            for await item in group {
                if let item = item { result.append(item) }
            }
            
            return result
        }
    }
    
    // Tasks inherit priorty of its enclosing context
    // If this func is run on the mainactor then the Task will too unless specified
    // Tasks execute immediately and concurrently. One does not depend on the other
    static func tasks() async {
        Task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            print("Value")
        }
        
        // Specified for low priority
        let task = Task.detached(priority: .low) {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            return "Value"
        }
        
        // Value assigned when task is done
        let value = await task.value
    }
}
