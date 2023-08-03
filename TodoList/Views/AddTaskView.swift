//
//  AddTaskView.swift
//  TodoList
//
//  Created by Yuga Samuel on 03/08/23.
//

import SwiftUI

struct AddTaskView: View {
    @State private var title = ""
    @State private var desc = ""
    @State private var dueDate = Date.now
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
                    in: dateRange,
                    displayedComponents: [.date, .hourAndMinute]
                )
                
            }
            
            Section("Task description") {
                TextEditor(text: $desc)
            }
            
            Button("Save") {
                
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
