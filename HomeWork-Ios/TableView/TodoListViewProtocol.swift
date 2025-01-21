//
//  TodoListViewProtocol.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 21.01.2025.
//

import Foundation

protocol TodoListViewProtocol: AnyObject {
    
    func reloadTableView()
    func showAlert(title: String, message: String)
}
