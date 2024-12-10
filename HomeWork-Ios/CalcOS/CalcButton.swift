//
//  CalcButton.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 15.09.2024.
//

import UIKit

class CalcButton: UIButton {
    
    var operation: UtilOperation?
    
    // init(operation: UtilOperation? = nil) {
    //     super.init(frame: .zero)
    //     self.operation = operation
    // }
    
    // required init(coder: NSCoder) {
    //     fatalError("init(coder:) has not been implemented")
    // }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(operation?.title, for: state)
    }
}
