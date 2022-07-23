//
//  StartPopupViewController.swift
//  Damagochi
//
//  Created by 최윤제 on 2022/07/23.
//

import UIKit

class StartPopupViewController: UIViewController {
    
    var selectdamagochi: Damagochi!
    
    @IBOutlet weak var damagochiImageView: UIImageView!
    @IBOutlet weak var damagochiLabel: UILabel!
    @IBOutlet weak var damagochiExpalinLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        desgin()
        buttonDesgin(button: cancelButton)
        buttonDesgin(button: startButton)
    }
    
    func desgin(){
        mainView.backgroundColor = ColorSet.background
        mainView.layer.cornerRadius = 8
        damagochiImageView.image = UIImage(named: selectdamagochi.image!)
        damagochiLabel.text = selectdamagochi.name
        damagochiLabel.damagochiFont()
        damagochiExpalinLabel.text = selectdamagochi.explain
        damagochiExpalinLabel.damagochiFontNomalFont()
        lineView.backgroundColor = ColorSet.font
    }
    
    func buttonDesgin(button: UIButton){
        button.tintColor = ColorSet.font
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 1
        
        if selectdamagochi.name == "준비중이에요"{
            startButton.isHidden = true
        }
    }



}
