//
//  TaskDetailView.swift
//  TodoList
//
//  Created by Yuga Samuel on 04/08/23.
//

import SwiftUI

struct TaskDetailView: View {
    let task: TaskEntity
    @State private var title = ""
    @State private var desc = ""
    @State private var dueDate = Date.now
    
    init(task: TaskEntity) {
        self.task = task
        
        _title = State(initialValue: task.wrappedTitle)
        _desc = State(initialValue: task.wrappedDesc)
        _dueDate = State(initialValue: task.dueDate ?? Date.now)
    }
    
    var formIsValid: Bool {
        if title.isEmpty || desc.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                DatePicker(
                    "Due Date",
                    selection: $dueDate,
                    in: DateRange.value,
                    displayedComponents: [.date, .hourAndMinute]
                )
                
            }
            
            Section("Task description") {
                TextEditor(text: $desc)
            }
            
            Button("Save changes") {

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
        TaskDetailView(task: task)
    }
}
