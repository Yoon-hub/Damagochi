//
//  TextField+Extension.swift
//  Damagochi
//
//  Created by 최윤제 on 2022/07/24.
//

import Foundation
import UIKit

extension UITextField{
    
    func underLine(placeholder:String){
        self.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.size.height-1, width: self.frame.width, height: 1)
        border.backgroundColor =  ColorSet.font.cgColor
        self.layer.addSublayer((border))
        self.textAlignment = .center
        self.textColor = ColorSet.font
        self.placeholder = placeholder
    }
}
