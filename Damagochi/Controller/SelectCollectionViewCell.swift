//
//  SelectCollectionViewCell.swift
//  Damagochi
//
//  Created by 최윤제 on 2022/07/22.
//

import UIKit

class SelectCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var damagochiImageView: UIImageView!
    @IBOutlet weak var damagochiLabel: UILabel!
    
    func setting(data: Damagochi){
        damagochiLabel.font = .systemFont(ofSize: 15)
        damagochiLabel.layer.borderWidth = 1
        damagochiLabel.layer.cornerRadius = 5
        damagochiLabel.layer.borderColor = ColorSet.font.cgColor
        
        damagochiLabel.textColor = ColorSet.font
        damagochiImageView.image = UIImage(named: data.image!)
        damagochiLabel.text = data.name
    }
    
    
}
