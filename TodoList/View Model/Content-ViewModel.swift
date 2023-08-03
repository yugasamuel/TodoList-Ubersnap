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
        @Published var isAdding = false
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
        
        func addNewTask(task: Task) {
            let newTask = TaskEntity(context: dataController.context)
            newTask.id = task.id
            newTask.title = task.title
            newTask.desc = task.desc
            newTask.dueDate = task.dueDate
            save()
        }
        
        func deleteTask(indexSet: IndexSet) {
            guard let index = indexSet.first else { return }
            let task = tasks[index]
            dataController.context.delete(task)
            save()
        }
        
        func save() {
            dataController.saveData()
            fetchTasks()
        }
    }
}
