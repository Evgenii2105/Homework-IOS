//
//  ViewController.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 26.08.2024.
//

import UIKit

class TwoLabelsViewController: UIViewController {
    
    // Создал первый Label
    private let lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Fomichev"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Создал второй Label
    private var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Evgenii Vadimovich"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Создаем контейнерный UIView с фиксированными размерами
    private var labelsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .darkGray
    }
    
    func setupViews() {
        view.addSubview(labelsContainerView)
        labelsContainerView.addSubview(lastNameLabel)
        labelsContainerView.addSubview(fullNameLabel)
        
        // Настройка Auto Layout для контейнерного UIView и Label's
        
        NSLayoutConstraint.activate([
            labelsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelsContainerView.widthAnchor.constraint(equalToConstant: 200),
            labelsContainerView.heightAnchor.constraint(equalToConstant: 100),
            
            lastNameLabel.leadingAnchor.constraint(equalTo: labelsContainerView.leadingAnchor, constant: 10),
            lastNameLabel.centerYAnchor.constraint(equalTo: labelsContainerView.centerYAnchor),
            lastNameLabel.trailingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor, constant: -10),
            
            fullNameLabel.trailingAnchor.constraint(equalTo: labelsContainerView.trailingAnchor, constant: -10),
            fullNameLabel.centerYAnchor.constraint(equalTo: labelsContainerView.centerYAnchor)
        ])
        
        // Добавляем настройки для предотвращения перекрытия
        lastNameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        fullNameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
}
