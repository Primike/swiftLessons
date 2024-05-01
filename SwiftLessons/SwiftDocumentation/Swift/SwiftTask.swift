//
//  SwiftTask.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 4/27/24.
//

import Foundation

class SwiftTask {
    var task: Task<(), Never>?

    func startTask() {
        task = Task {
            do {
                try await Task.sleep(nanoseconds: 1_000_000_000)
                print(Task.currentPriority)
            } catch {
                print("Task was cancelled or failed with an error.")
            }
        }
    }
    
    func checkCancellation() {
        task?.cancel()
    }
}
