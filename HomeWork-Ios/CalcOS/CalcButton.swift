//
//  CalcButton.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 15.09.2024.
//

import UIKit

class CalcButton: UIButton {
    
    var operation: UtilOperation
    
    init(operation: UtilOperation) {
        self.operation = operation
        super.init(frame: .zero)
        styleButton(operation)
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleButton(_ operation: UtilOperation) {
        self.layer.cornerRadius = 25
        self.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        self.backgroundColor = .orange
        self.setTitleColor(.white, for: .normal)
        setTitle(operation.title, for: .normal)
    }
}
