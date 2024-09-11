//
//  File.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 08.09.2024.
//

import UIKit

class CalculatorSwift: UIViewController {
    
    private let resultLabel: UILabel = {
        var label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 12)
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   private let myTextField: UITextField = {
        var textFile = UITextField()
        textFile.placeholder = "первое число"
        textFile.borderStyle = .roundedRect
        textFile.keyboardType = .decimalPad
        textFile.translatesAutoresizingMaskIntoConstraints = false
        textFile.backgroundColor = .white
        return textFile
    }()
    
    private let myTextFirst: UITextField = {
        var textFirst = UITextField()
        textFirst.placeholder = "второе число"
        textFirst.borderStyle = .roundedRect
        textFirst.keyboardType = .decimalPad
        textFirst.translatesAutoresizingMaskIntoConstraints = false
        textFirst.backgroundColor = .white
        return textFirst
    }()
    
   private lazy var myButton: UIButton = {
        var button = UIButton()
        button.setTitleColor(.lightGray, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .darkGray
        button.setTitle("выполнить", for: .normal)
        button.setTitle("вычесление выполняется", for: .highlighted)
        button.addTarget(self, action: #selector(calculateSum), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
   private let myConteiner: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let calculator = LogicCalculator()
    
    var myBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        myBottomConstraint = myConteiner.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        myConteiner.addSubview(myTextField)
        myConteiner.addSubview(myTextFirst)
        myConteiner.addSubview(resultLabel)
        myConteiner.addSubview(myButton)
        view.addSubview(myConteiner)
        
        setupConstraints()
        
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
            self.myBottomConstraint?.constant = -keyboardHeight
        }
    }
    @objc
   private func moveContentDown(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.myBottomConstraint?.constant = 0
        }
    }
        
    private func setupConstraints() {
        guard let myBottomConstraint = myBottomConstraint else { return }
        NSLayoutConstraint.activate([
            myConteiner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myBottomConstraint,
            myConteiner.widthAnchor.constraint(equalToConstant: 250),
            myConteiner.heightAnchor.constraint(equalToConstant: 300),
            
            myTextField.topAnchor.constraint(equalTo: myConteiner.topAnchor, constant: 60),
            myTextField.leadingAnchor.constraint(equalTo: myConteiner.leadingAnchor, constant: 10),
            myTextField.trailingAnchor.constraint(equalTo: myConteiner.trailingAnchor, constant: -10),
            
            myTextFirst.topAnchor.constraint(equalTo: myTextField.bottomAnchor, constant: 20),
            myTextFirst.leadingAnchor.constraint(equalTo: myConteiner.leadingAnchor, constant: 10),
            myTextFirst.trailingAnchor.constraint(equalTo: myConteiner.trailingAnchor, constant: -10),
            
            myButton.topAnchor.constraint(equalTo: myTextFirst.bottomAnchor, constant: 20),
            myButton.leadingAnchor.constraint(equalTo: myConteiner.leadingAnchor, constant: 10),
            myButton.trailingAnchor.constraint(equalTo: myConteiner.trailingAnchor, constant: -10),
            
            resultLabel.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: myConteiner.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: myConteiner.trailingAnchor, constant: -10),
            resultLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc
    private func calculateSum() {
        let result = calculator.addNumbers(myTextField.text, myTextFirst.text)
        resultLabel.text = "Результат: \(result)"
    }
}
