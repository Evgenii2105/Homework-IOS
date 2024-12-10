//
//  LogicCalcOC.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 12.09.2024.
//

import Foundation

class LogicCalcOC {
    
    var currentNumber: Double = 0
    var previousNumber: Double = 0
    var perations: CalcOperation?
    
    func inputnumber(_ number: Double) {
        currentNumber = number
    }
    
    let operations = ["+", "-", "x", "/"]
    
    func add() {
    }
}
