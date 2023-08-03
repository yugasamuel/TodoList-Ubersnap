//
//  TaskDetailView.swift
//  TodoList
//
//  Created by Yuga Samuel on 04/08/23.
//

import SwiftUI

struct TaskDetailView: View {
    let task: TaskEntity
    var onSave: (Task) -> Void
    @StateObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    init(task: TaskEntity, onSave: @escaping (Task) -> Void) {
        self.task = task
        self.onSave = onSave
        
        _viewModel = StateObject(wrappedValue: ViewModel(task: task))
    }
    
    var formIsValid: Bool {
        if viewModel.title.isEmpty || viewModel.desc.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $viewModel.title)
                DatePicker(
                    "Due Date",
                    selection: $viewModel.dueDate,
                    in: DateRange.value,
                    displayedComponents: [.date, .hourAndMinute]
                )
            }
            
            Section("Task description") {
                TextEditor(text: $viewModel.desc)
            }
            
            Button("Save changes") {
                let newTask = viewModel.addNewTask()
                onSave(newTask)
                dismiss()
            }
            .disabled(!formIsValid)
        }
        .navigationTitle(task.wrappedTitle)
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static let dataController = DataController()
    static let task = TaskEntity(context: dataController.context)
    
    static var previews: some View {
        TaskDetailView(task: task) { newTask in }
    }
}
