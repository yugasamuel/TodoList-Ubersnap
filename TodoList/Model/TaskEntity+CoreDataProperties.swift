//
//  TaskEntity+CoreDataProperties.swift
//  TodoList
//
//  Created by Yuga Samuel on 03/08/23.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var dueDate: Date?
    
    var wrappedID: UUID {
        id ?? UUID()
    }
    
    var wrappedTitle: String {
        title ?? "Untitled"
    }
    
    var wrappedDesc: String {
        desc ?? "No description."
    }
    
    var wrappedDueDate: String {
        dueDate?.formatted(date: .abbreviated, time: .shortened) ?? Date.now.formatted(date: .abbreviated, time: .shortened)
    }

}

extension TaskEntity : Identifiable {

}
