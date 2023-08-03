//
//  ContentView.swift
//  TodoList
//
//  Created by Yuga Samuel on 03/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.tasks) { task in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(task.wrappedTitle)
                            .font(.headline)
                        Text("Due date: \(task.wrappedDueDate)")
                    }
                }
            }
            .navigationTitle("Todo List")
            .toolbar {
                Button(action: {
                    viewModel.addNewTask()
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
