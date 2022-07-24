//
//  MainViewController.swift
//  Damagochi
//
//  Created by 최윤제 on 2022/07/24.
//

import UIKit
import Toast

class MainViewController: UIViewController {
    var damagochi : Damagochi!
    
    var level = UserDefaults.standard.dictionary(forKey: "level") as? [String:Int] ?? ["level" : 1, "bob" : 0, "water": 0] // 이게 돼??????????
    var nickname : String!
   

    
    @IBOutlet weak var damagochiNameLabel: UILabel!
    @IBOutlet weak var bobTextField: UITextField!
    @IBOutlet weak var bobButton: UIButton!
    @IBOutlet weak var waterTextField: UITextField!
    @IBOutlet weak var waterButton: UIButton!
    @IBOutlet weak var talkLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var damagochiImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        desginSetting()
        bobTextField.underLine(placeholder:"밥주세용")
        waterTextField.underLine(placeholder: "물주세용")
        bobButton.buttonDesgin()
        waterButton.buttonDesgin()
        damagochi = Damagochi(image: "", name: UserDefaults.standard.string(forKey: "damaName"), explain: "", damagochiLevelImage: UserDefaults.standard.array(forKey: "image") as? [String])
        damagochiNameLabel.text = damagochi.name
        levelUpdateCheck()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
   
        nickname = UserDefaults.standard.string(forKey: "nickName") ?? "대장"
        navigationItem.title = "\(nickname!)님의 다마고치"
        desginSetting()
    }
    
    func desginSetting(){
        view.backgroundColor = ColorSet.background
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(settingButtonClicked))
        navigationController?.navigationBar.tintColor = ColorSet.font
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: ColorSet.font]
        
        //standard, scrollEdge 설정
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = ColorSet.background
        appearance.titleTextAttributes = [.foregroundColor: ColorSet.font]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        damagochiNameLabel.damagochiFont(fontSize: 17)
        talkLabel.textColor = ColorSet.font
        levelLabel.textColor = ColorSet.font
        
    }
    
    @IBAction func bobButtonClicked(_ sender: Any) {
        guard let bobtext = bobTextField.text, Int(bobtext) != nil else {
            if bobTextField.text == ""{
                level["bob"]! += 1
                levelUpdateCheck()
            }else{
                self.view.makeToast("숫자만 입력해줘요오ㅠ")
                talkLabel.text = "밥줘요!!"
                bobTextField.text = ""
            }
            return
        }
        
      if Int(bobtext)! > 49 {
            self.view.makeToast("그렇게 많이는 못먹어요 우엨")
            talkLabel.text = "우엨ㅋ웽엨"
            bobTextField.text = ""
        }
        else{
            level["bob"]! += Int(bobtext)!
            bobTextField.text = ""
        }
        levelUpdateCheck()
    }
    
    @IBAction func waterButtonClicked(_ sender: Any) {
        guard let watertext = waterTextField.text, Int(watertext) != nil else {
            if waterTextField.text == ""{
                level["water"]! += 1
                levelUpdateCheck()
            }else{
                self.view.makeToast("숫자만 입력해줘요오ㅠ")
                talkLabel.text = "물줘요!!"
                waterTextField.text = ""
            }
            return
        }
        
      if Int(watertext)! > 99 {
            self.view.makeToast("그렇게 많이는 못마셔요 우엨")
            talkLabel.text = "우엨ㅋ웽엨"
            waterTextField.text = ""
        }
        else{
            level["water"]! += Int(watertext)!
            waterTextField.text = ""
        }
        levelUpdateCheck()
    }
    
    
    func levelUpdateCheck(){
        levelCalculate()
        damagochiImageView.image = UIImage(named: (damagochi.damagochiLevelImage?[level["level"]!])!)
        levelLabel.text = "LV\(level["level"]!) • 밥알 \(level["bob"]!)개 • 물방울 \(level["water"]!)개"
        
        let talk = DamagochiTalk.talk.randomElement()
        talkLabel.text = talkLabel.text == talk ? "과제 너무 시렁라ㅣㅁ어라어라어라어라" : talk
        UserDefaults.standard.set(level, forKey: "level")
    }

    func levelCalculate(){
        var sum = Double(level["bob"]!) / 5 + Double(level["water"]!)/2
        
        switch sum{
        case 0..<20 : level["level"] = 1
        case 20..<30 : level["level"] = 2
        case 30..<40 : level["level"] = 3
        case 40..<50 : level["level"] = 4
        case 50..<60 : level["level"] = 5
        case 60..<70 : level["level"] = 6
        case 70..<80 : level["level"] = 7
        case 80..<90 : level["level"] = 8
        case 90..<100 : level["level"] = 9
        default : level["level"] = 10
        }
        
    }
    @objc func settingButtonClicked(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
