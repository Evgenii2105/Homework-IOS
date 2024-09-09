//
//  LogicCalculator.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 08.09.2024.
//

import UIKit

class LogicCalculator {
    
    @objc
    func calculateButtonPressed(myTextField: UITextField, myTextFirst: UITextField,
                                resultLabel: UILabel) {
        guard let numberA = Double(myTextField.text ?? ""),
                let numberB = Double(myTextFirst.text ?? "") else {
            resultLabel.text = "ошибка"
            return
        }
        
        let result = numberA + numberB
        resultLabel.text = "результат: \(result)"
    }
    
}
                                
