//
//  CalcOperation.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 14.09.2024.
//

import Foundation

enum UtilOperation: Hashable {
    case digitOperaton(DigitOperation)
    case calcOperation(CalcOperation)
    
    var title: String {
        switch self {
        case let .digitOperaton(digit):
            switch digit {
            case .one:
                return "1"
            case .two:
                return "2"
            case .three:
                return "3"
            case .four:
                return "4"
            case .five:
                return "5"
            case .six:
                return "6"
            case .seven:
                return "7"
            case .eight:
                return "8"
            case .nine:
                return "9"
            case .zero:
                return "0"
            }
        case let .calcOperation(calc):
            switch calc {
            case .addition:
                return "+"
            case .subtraction:
                return "-"
            case .multiplication:
                return "*"
            case .division:
                return "/"
            case .equals:
                return "="
            case .clear:
                return "AC"
            case .negative:
                return "+/-"
            case .percent:
                return "%"
            case .comma:
                return ","
            }
        }
    }
    static var allCases: [UtilOperation] = [.calcOperation(.addition), .digitOperaton(.five), .calcOperation(.clear),
                                            .calcOperation(.division), .calcOperation(.equals),
                                            .calcOperation(.multiplication),
                                            .calcOperation(.negative), .calcOperation(.percent),
                                            .calcOperation(.subtraction), .digitOperaton(.eight),
                                            .digitOperaton(.four), .digitOperaton(.nine),
                                            .digitOperaton(.one), .digitOperaton(.two),
                                            .digitOperaton(.three),
                                            .digitOperaton(.six), .digitOperaton(.seven),
                                            .digitOperaton(.zero), .calcOperation(.comma)]
    }

enum CalcOperation {
    case addition
    case subtraction
    case multiplication
    case division
    case equals
    case clear
    case negative
    case percent
    case comma
}

enum DigitOperation {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case zero
}
