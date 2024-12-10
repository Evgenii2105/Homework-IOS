//
//  HWRepead.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 04.12.2024.
//

import UIKit

enum CarColor {
    case black
    case blue
    case white
    case orange
    case red
    case green
}

class CarButton: UIButton {
    
    init(carColor: CarColor) {
        super.init(frame: .zero)
        switch carColor {
        case .black:
            backgroundColor = .black
        case .blue:
            backgroundColor = .blue
        case .white:
            backgroundColor = .white
        case .orange:
            backgroundColor = .orange
        case .red:
            backgroundColor = .red
        case .green:
            backgroundColor = .green
        }
    }
    
    init(сarButton: CarColor) {
        super.init(frame: .zero)
        self.configure(carColor: сarButton)
    }
    
    init() {
        super.init(frame: .zero)
        configure(carColor: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(carColor: CarColor?) {
        guard let carColor else {
            backgroundColor = .gray
            setTitle("color not found", for: .normal)
            return
        }
        switch carColor {
        case .black:
            backgroundColor = .black
            setTitle("Car black", for: .normal)
        case .blue:
            backgroundColor = .blue
            setTitle("Car blue", for: .normal)
        case .white:
            backgroundColor = .white
            setTitle("Car white", for: .normal)
        case .orange:
            backgroundColor = .orange
            setTitle("Car orange", for: .normal)
        case .red:
            backgroundColor = .red
            setTitle("Car red", for: .normal)
        case .green:
            backgroundColor = .green
            setTitle("Car green", for: .normal)
        }
    }
}
