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
    var onSave: (TaskEntity) -> Void
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let currentDate = Date()
        
        // Get the start of the current year
        let startComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
        guard let currentDay = calendar.date(from: startComponents) else {
            fatalError("Failed to get the start of the current year.")
        }
        
        // Get 1 year after the startComponents
        guard let oneYearAfterCurrentDay = calendar.date(byAdding: .year, value: 1, to: currentDay) else {
            fatalError("Failed to calculate one year after the start of the current year.")
        }
        
        return currentDay...oneYearAfterCurrentDay
    }()
    
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
                    in: dateRange,
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
