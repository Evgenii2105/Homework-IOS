//
//  GuestCode.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 05.09.2024.
//

import UIKit

class GuestCounterViewController: UIViewController {
    
    //создал Label, который будет счетчиком
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //создаю две кнопки + и -
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()
    
    //создал переменную, которая хранит текущее число
    private var guestCount: Int = 0 {
        didSet {
            counterLabel.text = "\(guestCount)"
        }
    }

    //загрузка
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(counterLabel)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        
        setupConstraints()
        
        plusButton.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(decreaseCount), for: .touchUpInside)
    }
    
    // методы увеличения и уменьшения
    @objc private func increaseCount() {
        if guestCount < 50 {
            guestCount += 1
        }
    }
    
    @objc private func decreaseCount() {
        if guestCount > 0 {
            guestCount -= 1
        }
    }
    
    private func setupConstraints() {
        
        // настройка ограничений
        NSLayoutConstraint.activate([
            
            counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            counterLabel.widthAnchor.constraint(equalToConstant: 100),
            counterLabel.heightAnchor.constraint(equalToConstant: 75),
            
            plusButton.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: 30),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            plusButton.widthAnchor.constraint(equalToConstant: 75),
            plusButton.heightAnchor.constraint(equalToConstant: 75),
            
            minusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            minusButton.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: 30),
            minusButton.widthAnchor.constraint(equalToConstant: 75),
            minusButton.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
}
