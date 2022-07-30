//
//  File.swift
//  Damagochi
//
//  Created by 최윤제 on 2022/07/23.
//

import UIKit

extension UILabel{
    
    func damagochiFont(fontSize: CGFloat = 15){
        
        self.font = .boldSystemFont(ofSize: fontSize)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = ColorSet.font.cgColor
        self.textColor = ColorSet.font
        
    }
    func damagochiFontNomalFont(){
        self.font = .systemFont(ofSize: 15)
        self.textColor = ColorSet.font
    }
}
