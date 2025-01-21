//
//  TodoListController.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 05.01.2025.
//

import UIKit

class TodoListController: UIViewController, TodoListViewProtocol {
    
    private let todos: [TodoItem]
    
    private lazy var presenter: TodoListPresenterProtocol = TodoListPresenter(view: self)
    
    private let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        return table
    }()
    
    private var containerConstraint: NSLayoutConstraint?
    private let cellIdentifier = "ToDoItemCell"
    
    init() {
        self.todos = []
        super.init(nibName: nil, bundle: nil)
        self.presenter = TodoListPresenter(view: self)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = TodoListPresenter(view: self)
        view.backgroundColor = .white
        view.addSubview(table)
        configureTableView()
        setupConstraints()
        setaper()
        table.rowHeight = 80
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(openAlert))
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(moveContentUp),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(moveContentDown),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc
    private func moveContentUp(notification: NSNotification) {
        guard let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            print("Ошибка")
            return
        }
        let keyBoardFrame = keyboardSize.cgRectValue
        let keyboardHeight = keyBoardFrame.height
        
        UIView.animate(withDuration: 0.3) {
            self.containerConstraint?.constant = -keyboardHeight
        }
    }
    
    @objc
    private func moveContentDown(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.containerConstraint?.constant = 0
        }
    }
    
    @objc
    private func openAlert() {
        let alert = UIAlertController(title: "Create todo", message: "", preferredStyle: .alert)
        alert.addTextField()
        let saveButton = UIAlertAction(title: "Save", style: .default) { _ in
            guard let textName = alert.textFields?.first?.text else { return }
            self.presenter.AddTodo(title: textName, subTitle: "")
        }
        
        alert.addAction(saveButton)
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
        alert.addAction(cancelButton)
        
        present(alert, animated: true)
    }
    
    func reloadTableView() {
        table.reloadData()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // Mark : создание линии
    private func setaper() {
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .white
        apperance.shadowColor = .black
        
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
    }
    
    private func configureTableView() {
        table.delegate = self
        table.dataSource = self
        table.register(CustomTableCell.self, forCellReuseIdentifier: cellIdentifier)
        table.allowsSelectionDuringEditing = true
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension TodoListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? CustomTableCell else {
            return UITableViewCell()
        }
        
        let todoItem = presenter.todos[indexPath.row]
        cell.configure(with: todoItem)
        
        return cell
    }
    
    // delete:
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { _, _, completionHandler in
            self.presenter.deleteTodo(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    // move:
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        presenter.moveTodo(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canPerformAction action: Selector,
                   forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        guard action == #selector(copy(_:)) else { return false }
        return true
    }
    
    func tableView(_ tableView: UITableView, performAction action: Selector,
                   forRowAt indexPath: IndexPath, withSender sender: Any?) {
        guard action == #selector(copy(_:)) else { return }
        let cell = tableView.cellForRow(at: indexPath)
        let pasteBoard = UIPasteboard.general
        pasteBoard.string = cell?.textLabel?.text
    }
}
