//
//  CalcOperation.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 14.09.2024.
//

import Foundation

enum DigitOperation: Hashable {
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
    
    var title: String {
        switch self {
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
    }
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
    static var allCases: [UtilOperation] = [.calcOperation(.clear), .calcOperation(.negative), .calcOperation(.percent),
                                            .calcOperation(.division),
                                            .digitOperaton(.seven), .digitOperaton(.eight), .digitOperaton(.nine),
                                            .calcOperation(.multiplication),
                                            .digitOperaton(.four), .digitOperaton(.five), .digitOperaton(.six),
                                            .calcOperation(.subtraction),
                                            .digitOperaton(.one), .digitOperaton(.two), .digitOperaton(.three),
                                            .calcOperation(.addition),
                                            .digitOperaton(.zero), .calcOperation(.comma),
                                            .calcOperation(.equals)]
}
