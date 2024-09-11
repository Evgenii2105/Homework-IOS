//
//  LogicCalculator.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 08.09.2024.
//

import Foundation

class LogicCalculator {
    
    func addNumbers(_ numberA: String?, _ numberB: String?) -> String {
        
        guard let numberA = numberA,
           let numberB = numberB,
           let numA = Double(numberA),
              let numB = Double(numberB) else {
            return "ошибка"
        }
          
        let sum = numA + numB
        return String(sum)
    }
}
