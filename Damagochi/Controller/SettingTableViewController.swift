//
//  settingTableViewController.swift
//  Damagochi
//
//  Created by 최윤제 on 2022/07/24.
//

import UIKit

class SettingTableViewController: UITableViewController {

    
    @IBOutlet var tableViewCell: [UITableViewCell]!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "설정"
        navigationController?.navigationBar.topItem?.title = ""
        tableView.tintColor = ColorSet.font
        tableView.backgroundColor = ColorSet.background
        tableView.rowHeight = 50
        for i in tableViewCell{
            i.backgroundColor = ColorSet.background
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        nickNameLabel.text = UserDefaults.standard.string(forKey: "nickName") ?? "대장님"
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            nickNameChanged()
        } else if indexPath.row == 1{
            changeDamagochi()
        } else if indexPath.row == 2 {
            resetButton()
        }
    }
    
    func nickNameChanged(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "NickNameSettingViewController") as! NickNameSettingViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func changeDamagochi(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SelectCollectionViewController") as! SelectCollectionViewController
        vc.titleName = "다마고치 변경하기"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func resetButton(){
        let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "웅", style: .default) { UIAlertAction in
            for key in UserDefaults.standard.dictionaryRepresentation().keys {
                        UserDefaults.standard.removeObject(forKey: key.description)
                    }
            
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "UINaiv") as? UINavigationController
            
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            
            sceneDelegate?.window?.rootViewController = vc
            sceneDelegate?.window?.makeKeyAndVisible()
        }
        let cancel = UIAlertAction(title: "아냐!", style: .default)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    


}
