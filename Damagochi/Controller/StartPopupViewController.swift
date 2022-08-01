//
//  StartPopupViewController.swift
//  Damagochi
//
//  Created by 최윤제 on 2022/07/23.
//

import UIKit

class StartPopupViewController: UIViewController {
    
    var selectdamagochi: Damagochi!
    var notMake = false
    var startButtonTitle = "시작하기"
    let notificationCenter = UNUserNotificationCenter.current()
    
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
        startButton.setTitle(startButtonTitle, for: .normal)
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
        button.startPopViewButtonDesgin()
        if notMake{
            startButton.isHidden = true
        }
    }

    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func startButtonClicked(_ sender: UIButton) {
        UserDefaultsManager.standard.damaName = selectdamagochi.name!
        UserDefaultsManager.standard.image = selectdamagochi.damagochiLevelImage!
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: MainViewController.reuseidetifier) as! MainViewController
        
        requestAuthorization() // 알림 등록
        sceneDelegate?.window?.rootViewController = UINavigationController(rootViewController: vc)
        sceneDelegate?.window?.makeKeyAndVisible()
        
    }
    
    
    //MARK: - Local Notification
    func requestAuthorization(){
        let authorizationOptions = UNAuthorizationOptions(arrayLiteral: .alert)
        
        notificationCenter.requestAuthorization(options: authorizationOptions) { succes, error in
            if succes{
                self.sendNotification()
            } else {
                print("error!")
            }
        }
    }
    

    func sendNotification(){
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "밥줄시간입니다!!!!"
        notificationContent.body = "\(UserDefaultsManager.standard.damaName) 가 배고파요"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        
        let request = UNNotificationRequest(identifier: "1", content: notificationContent, trigger: trigger)
        notificationCenter.add(request)
        
    }
    
    
    
}
