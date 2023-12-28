//
//  Button.swift
//  calculator
//
//  Created by Дмитрий Яновский on 24.12.23.
//

import Foundation
import UIKit

class Button: UIButton {
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        initial()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initial()
    }
    func initial(){
        clipsToBounds = true
        backgroundColor = .lightGray
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        widthAnchor.constraint(equalToConstant: 90).isActive = true
        
    }
}
