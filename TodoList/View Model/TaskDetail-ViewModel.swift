//
//  TaskDetail-ViewModel.swift
//  TodoList
//
//  Created by Yuga Samuel on 04/08/23.
//

import Foundation

extension TaskDetailView {
    @MainActor class ViewModel: ObservableObject {
        @Published var title: String
        @Published var desc: String
        @Published var dueDate: Date
        
        init(task: TaskEntity) {
            title = task.wrappedTitle
            desc = task.wrappedDesc
            dueDate = task.dueDate ?? Date.now
        }
        
        func addNewTask() -> Task {
            let newTask = Task(title: title, desc: desc, dueDate: dueDate)
            return newTask
        }
    }
}
