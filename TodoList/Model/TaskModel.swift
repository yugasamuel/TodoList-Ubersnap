//
//  TaskModel.swift
//  TodoList
//
//  Created by Yuga Samuel on 04/08/23.
//

import Foundation

struct Task {
    var id = UUID()
    let title: String
    let desc: String
    let dueDate: Date
}
