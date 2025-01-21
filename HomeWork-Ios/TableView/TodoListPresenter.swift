//
//  TodoListPresenter.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 19.01.2025.
//

import Foundation

protocol TodoListPresenterProtocol {
    
    var todos: [TodoItem] { get }
    
    func AddTodo(title: String, subTitle: String)
    func deleteTodo(at index: Int)
    func moveTodo(from sourceIndex: Int, to destinationIndex: Int)
}

class TodoListPresenter: TodoListPresenterProtocol {
    
    var view: TodoListViewProtocol?
    
    var todos: [TodoItem] = [
        TodoItem(title: "Test", subTitle: "111", image: "circlebadge"),
        TodoItem(title: "Test1", subTitle: "222", image: "circlebadge.fill"),
        TodoItem(title: "Test3", subTitle: "333", status: true, image: "circlebadge"),
        TodoItem(title: "Test4", subTitle: "444", status: true, image: "circlebadge.fill")
    ]
    
    init(view: TodoListViewProtocol?) {
        self.view = view
    }
    
    func AddTodo(title: String, subTitle: String) {
        let newTodo = TodoItem(title: title, subTitle: subTitle, image: "circlebadge")
        todos.append(newTodo)
        view?.reloadTableView()
    }
    
    func deleteTodo(at index: Int) {
        guard todos.indices.contains(index) else { return }
        todos.remove(at: index)
        view?.reloadTableView()
    }
    
    func moveTodo(from sourceIndex: Int, to destinationIndex: Int) {
        guard todos.indices.contains(sourceIndex), todos.indices.contains(destinationIndex) else { return }
        let movedItem = todos.remove(at: sourceIndex)
        todos.insert(movedItem, at: destinationIndex)
        view?.reloadTableView()
    }
}
