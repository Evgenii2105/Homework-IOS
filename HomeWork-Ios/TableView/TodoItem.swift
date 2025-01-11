//
//  TodoList.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 06.01.2025.
//

import Foundation

struct TodoItem {
    var name: String
    var status: ToDoStatus = .planned
}

enum ToDoStatus {
    case completed
    case planned
}
