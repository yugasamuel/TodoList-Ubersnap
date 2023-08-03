//
//  Content-ViewModel.swift
//  TodoList
//
//  Created by Yuga Samuel on 03/08/23.
//

import Foundation
import CoreData

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var tasks = [TaskEntity]()
        let dataController = DataController.instance
        
        init() {
            fetchTasks()
        }
        
        func fetchTasks() {
            let request = NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
            do {
                tasks = try dataController.context.fetch(request)
            } catch let error {
                print("Error fetching. \(error.localizedDescription)")
            }
        }
        
        func addNewTask() {
            _ = TaskEntity(context: dataController.context)
            save()
        }
        
        func save() {
            dataController.saveData()
            fetchTasks()
        }
    }
}
