//
//  AddTaskView.swift
//  TodoList
//
//  Created by Yuga Samuel on 03/08/23.
//

import SwiftUI

struct AddTaskView: View {
    @StateObject var viewModel = ViewModel()
    @Environment(\.dismiss) var dismiss
    var onSave: (Task) -> Void
    
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
            
            Button("Save") {
                let newTask = viewModel.addNewTask()
                onSave(newTask)
                dismiss()
            }
            .disabled(!formIsValid)
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView() { newTask in }
    }
}
