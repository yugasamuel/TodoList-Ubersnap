//
//  AddTask-ViewModel.swift
//  TodoList
//
//  Created by Yuga Samuel on 03/08/23.
//

import Foundation

extension AddTaskView {
    @MainActor class ViewModel: ObservableObject {
        let dataController = DataController.instance
        @Published var title = ""
        @Published var desc = ""
        @Published var dueDate = Date.now
        
        func addNewTask() -> TaskEntity {
            let newTask = TaskEntity(context: dataController.context)
            newTask.title = title
            newTask.desc = desc
            newTask.dueDate = dueDate
            return newTask
        }
    }
}
