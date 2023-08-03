//
//  DataController.swift
//  TodoList
//
//  Created by Yuga Samuel on 03/08/23.
//

import Foundation
import CoreData

class DataController {
    static let instance = DataController()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "TodoList")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } else {
                print("Successfully loaded core data!")
            }
        }
        context = container.viewContext
    }
    
    func saveData() {
        do {
            try context.save()
        } catch let error {
            print("Error saving. \(error.localizedDescription)")
        }
    }
}

