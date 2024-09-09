//
//  File.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 08.09.2024.
//

import UIKit

class CalculatorSwift: UIViewController {
    
    var resultLabel: UILabel = {
        var label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 12)
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var myTextField: UITextField = {
        var textFile = UITextField()
        textFile.placeholder = "первое число"
        textFile.borderStyle = .roundedRect
        textFile.keyboardType = .decimalPad
        textFile.translatesAutoresizingMaskIntoConstraints = false
        return textFile
    }()
    
    var myTextFirst: UITextField = {
        var textFirst = UITextField()
        textFirst.placeholder = "второе число"
        textFirst.borderStyle = .roundedRect
        textFirst.keyboardType = .decimalPad
        textFirst.translatesAutoresizingMaskIntoConstraints = false
        return textFirst
    }()
    
    lazy var myButton: UIButton = {
        var button = UIButton()
        button.setTitleColor(.lightGray, for: .normal)
        button.backgroundColor = .white
        button.setTitle("выполнить", for: .normal)
        button.addTarget(self, action: #selector(calculateSum), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let calculator = LogicCalculator()
        
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
        super.viewDidLoad()
        view.addSubview(myTextField)
        view.addSubview(myTextFirst)
        view.addSubview(resultLabel)
        view.addSubview(myButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            myTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            myTextField.widthAnchor.constraint(equalToConstant: 200),
            myTextField.heightAnchor.constraint(equalToConstant: 40),
            
            myTextFirst.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myTextFirst.topAnchor.constraint(equalTo: myTextField.bottomAnchor, constant: 20),
            myTextFirst.widthAnchor.constraint(equalToConstant: 200),
            myTextFirst.heightAnchor.constraint(equalToConstant: 40),
            
            myButton.topAnchor.constraint(equalTo: myTextFirst.bottomAnchor, constant: 20),
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.widthAnchor.constraint(equalToConstant: 150),
            myButton.heightAnchor.constraint(equalToConstant: 40),
            
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: 20),
            resultLabel.widthAnchor.constraint(equalToConstant: 250),
            resultLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc
    private func calculateSum() {
        calculator.calculateButtonPressed(myTextField: myTextField, myTextFirst: myTextFirst,
                                          resultLabel: resultLabel)
    }
}
