//
//  CalcOSController.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 12.09.2024.
//

import UIKit

class CalcOSController: UIViewController {
    
    private var buttons: [CalcButton] = []
    private var objectInputLogic = InputOperation(lhs: 0.0, rhs: 0.0, operation: .addition)
    
    private let labelResult: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let myStackView = UIStackView()
        myStackView.axis = .vertical
        myStackView.distribution = .fillEqually
        myStackView.spacing = 10
        myStackView.backgroundColor = .black
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        return myStackView
    }()
    
    private let containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .black
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private let logicOperation = LogicCalcOC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(containerView)
        containerView.addSubview(labelResult)
        containerView.addSubview(stackView)
        setupConstraint()
        prepareButtons()
        
        for row in stride(from: 0, to: buttons.count, by: 4) {
            let rowStack = UIStackView()
            rowStack.axis = .horizontal
            rowStack.distribution = .fillEqually
            rowStack.spacing = 10
            
            let buttonRow = buttons[row..<min(row + 4, buttons.count)].compactMap { $0 }
            for button in buttonRow {
                rowStack.addArrangedSubview(button)
            }
            stackView.addArrangedSubview(rowStack)
        }
    }
    
    private func prepareButtons() {
        for operation in UtilOperation.allCases {
            let button = CalcButton(operation: operation)
            buttons.append(button)
            button.addTarget(self, action: #selector(processButton), for: .touchUpInside)
        }
    }
    
    @objc
    func processButton(sender: CalcButton) {
        switch sender.operation {
        case .digitOperaton(let digitOperation):
            setUpDigit(digitOperation)
        case .calcOperation(let oper):
            setUpCalcOperation(oper, objectInputLogic)
        }
    }
    
    private func setUpDigit(_ digit: DigitOperation) {
        var digitResult = labelResult.text ?? "0"
        let inputLhs = digit.title
        if digitResult == "0" {
            digitResult = inputLhs
        } else {
            digitResult += inputLhs
        }
        labelResult.text = digitResult
        
        if objectInputLogic.operation == .equals || objectInputLogic.operation == .clear {
            objectInputLogic.lhs = Double(digitResult) ?? 0.0
        } else {
            objectInputLogic.rhs = Double(digitResult) ?? 0.0
        }
    }
    
    private func setUpCalcOperation(_ operation: CalcOperation, _ input: InputOperation) {
        switch operation {
        case .addition, .division, .multiplication, .subtraction:
            objectInputLogic.operation = operation
            objectInputLogic.lhs = Double(labelResult.text ?? "0") ?? 0.0
            labelResult.text = "0"
        case .equals:
            logicOperation.performCalculation(objectInputLogic)
            labelResult.text = "\(logicOperation.sum)"
        case .clear:
            objectInputLogic = InputOperation(lhs: 0.0, rhs: 0.0, operation: .clear)
            labelResult.text = "0"
        case .negative:
            var negativeResult = Double(labelResult.text ?? "0")
            labelResult.text = "\(-(negativeResult ?? 0.0))"
            if objectInputLogic.lhs == 0.0 {
                negativeResult = -objectInputLogic.lhs
            } else {
                negativeResult = -objectInputLogic.rhs
            }
        case .percent:
            var persentResult = Double(labelResult.text ?? "0")
            labelResult.text = "\((persentResult ?? 0.0).truncatingRemainder(dividingBy: persentResult ?? 0.0))"
            if objectInputLogic.lhs == 0 {
                persentResult = objectInputLogic.lhs.truncatingRemainder(dividingBy: objectInputLogic.lhs)
            }
        case .comma:
            if !(labelResult.text?.contains(".") ?? false) {
                labelResult.text? += "."
            }
        }
    }
    
    private func setupConstraint() {
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            labelResult.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelResult.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            labelResult.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            labelResult.heightAnchor.constraint(equalToConstant: 250),
            
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            stackView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
}
