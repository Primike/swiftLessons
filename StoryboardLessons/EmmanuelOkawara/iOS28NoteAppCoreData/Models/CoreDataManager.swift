//
//  CoreDataManager.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 3/18/23.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager(modelName: "MyNotes")
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { description, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            
            completion?()
        }
    }
}
