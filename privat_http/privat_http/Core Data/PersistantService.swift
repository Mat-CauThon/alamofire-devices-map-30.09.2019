//
//  PersistantService.swift
//  privat_http
//
//  Created by Roman Mishchenko on 9/29/19.
//  Copyright © 2019 Roman Mishchenko. All rights reserved.
//

import Foundation
import CoreData
class PersistentService
{
    private init() {}
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data stack
    
    static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "privat_http")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
              //  print("Saved to CoreData Class")
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
