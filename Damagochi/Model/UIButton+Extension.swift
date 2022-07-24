//
//  UIButton+Extension.swift
//  Damagochi
//
//  Created by 최윤제 on 2022/07/24.
//

import Foundation
import UIKit

extension UIButton{
    
    func buttonDesgin(){
        self.tintColor = ColorSet.font
        self.layer.borderColor = ColorSet.font.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 6
    }
}
