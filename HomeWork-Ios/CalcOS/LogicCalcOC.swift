//
//  LogicCalcOC.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 12.09.2024.
//

import Foundation

class LogicCalcOC {
    
    var sum: Double = 0.0
    
    func performCalculation(_ input: InputOperation) {
        switch input.operation {
        case .addition:
            sum = input.lhs + input.rhs
        case .subtraction:
            sum = input.lhs - input.rhs
        case .multiplication:
            sum = input.lhs * input.rhs
        case .division:
            sum = input.lhs / input.rhs
        case .equals:
            print(sum)
        case .clear:
            print(sum)
        case .negative:
            sum = -sum
        case .percent:
            sum = input.lhs / input.rhs
        case .comma:
            if !String(input.lhs).contains(".") {
            }
        }
    }
}

struct InputOperation {
    
    var lhs: Double
    var rhs: Double
    var operation: CalcOperation
}
