//
//  CalcOSController.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 12.09.2024.
//

import UIKit

class CalcOSController: UIViewController {
    
    private var buttons: [UtilOperation: CalcButton] = [:]
    
    let labelResult: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.backgroundColor = .white
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let myStackView = UIStackView()
        myStackView.axis = .vertical
        myStackView.distribution = .fillEqually
        myStackView.spacing = 10
        myStackView.backgroundColor = .blue
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        return myStackView
    }()
    
    let containerView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .blue
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // prepareButtons()
        view.addSubview(containerView)
        containerView.addSubview(labelResult)
        containerView.addSubview(stackView)
        setupConstraint()
        
        let label = Label(colorText: .red)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        
        let container = Container(container: .car(carCopy))
        label.setContent(container: container)

        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        var array = [buttons[.calcOperation(.clear)],
                     buttons[.calcOperation(.negative)],
                     buttons[.calcOperation(.percent)],
                     buttons[.calcOperation(.division)]
        ]
        
        array.append(contentsOf: [buttons[.digitOperaton(.seven)],
                                  buttons[.digitOperaton(.eight)],
                                  buttons[.digitOperaton(.nine)],
                                  buttons[.calcOperation(.multiplication)]])
        
        array.append(contentsOf: [buttons[.digitOperaton(.four)],
                                  buttons[.digitOperaton(.five)],
                                  buttons[.digitOperaton(.five)],
                                  buttons[.digitOperaton(.six)],
                                  buttons[.calcOperation(.subtraction)]])
        
        array.append(contentsOf: [buttons[.digitOperaton(.one)],
                                  buttons[.digitOperaton(.two)],
                                  buttons[.digitOperaton(.three)],
                                  buttons[.calcOperation(.addition)]])
        
        array.append(contentsOf: [buttons[.digitOperaton(.zero)],
                                  buttons[.calcOperation(.comma)],
                                  buttons[.calcOperation(.equals)]])
        
        createRow(withButtons: array.compactMap { $0 })
    }
    
    // func prepareButtons() {
    //     for i in UtilOperation.allCases {
    //         switch i {
    //         case .digitOperaton(let digitOperation):
    //             buttons[i] = CalcButton(operation: i)
    //         case .calcOperation(let calcOperation):
    //             buttons[i] = CalcButton(operation: i)
    //         }
    //     }
    // }
    
    @objc
    func number() {
    }
    
    @objc
    func clearResult() {
        
        labelResult.text = "0"
    }
    
    @objc
    func addNumber(_ sender: UIButton) {
    }
    
    func createRow(withButtons: [CalcButton]) -> UIStackView {
        let rowstackView = UIStackView(arrangedSubviews: withButtons)
        rowstackView.axis = .horizontal
        rowstackView.spacing = 10
        rowstackView.distribution = .fillEqually
        return rowstackView
    }
    
    @objc
    func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        if labelResult.text == "0" {
            labelResult.text = number
        } else {
            labelResult.text = "\(labelResult.text!)\(number)"
        }
    }
    
    func setupConstraint() {
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            labelResult.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelResult.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            labelResult.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            labelResult.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20),
            labelResult.heightAnchor.constraint(equalToConstant: 225),
            
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func addsetupButton() {
    }
}
