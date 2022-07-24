//
//  NickNameSettingViewController.swift
//  Damagochi
//
//  Created by 최윤제 on 2022/07/24.
//

import UIKit

class NickNameSettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "\(UserDefaults.standard.string(forKey: "nickName") ?? "대장")님 이름 정하기"
        navigationItem.rightBarButtonItem = .init(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
        textField.underLine(placeholder: "이름을 입력하세용")
        view.backgroundColor = ColorSet.background
       
    }
    
    @objc func saveButtonClicked(){
        if textField.text == ""{
            textField.placeholder = "닉네임을 입력하세요!"
        } else {
            UserDefaults.standard.set(textField.text, forKey: "nickName")
            self.navigationController?.popViewController(animated: true)
        }
    }



}
