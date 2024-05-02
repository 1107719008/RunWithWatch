//
//  CoreDataStack.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/15.
//

import Foundation
import CoreData

class CoreDataStack: ObservableObject {
    static let shared = CoreDataStack()
    
    init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PathModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // Save data
    func saveContext() {
        let context = persistentContainer.viewContext
        guard context.hasChanges else {
            print("No changes to save")
            return
        }
        
        do {
            try context.save()
            print("Data has saved!")
        } catch {
            let nsError = error as NSError
            fatalError("Failed to save Core Data context: \(nsError), \(nsError.userInfo)")
        }
    }
    
    //add new route
    
    
}
