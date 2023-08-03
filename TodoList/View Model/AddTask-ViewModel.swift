//
//  AddTask-ViewModel.swift
//  TodoList
//
//  Created by Yuga Samuel on 03/08/23.
//

import Foundation

struct Task {
    var id = UUID()
    let title: String
    let desc: String
    let dueDate: Date
}

extension AddTaskView {
    @MainActor class ViewModel: ObservableObject {
        let dataController = DataController.instance
        @Published var title = ""
        @Published var desc = ""
        @Published var dueDate = Date.now
        
        func addNewTask() -> Task {
            let newTask = Task(title: title, desc: desc, dueDate: dueDate)
            return newTask
        }
    }
}
