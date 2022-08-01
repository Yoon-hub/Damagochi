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
        contentView.backgroundColor = ColorSet.background
        damagochiLabel.damagochiFont() // extension
        damagochiImageView.image = UIImage(named: data.image!)
        damagochiLabel.text = data.name
    }
    
    
}
