//
//  UseDefaultsManager.swift
//  Damagochi
//
//  Created by 최윤제 on 2022/08/01.
//

import Foundation

class UserDefaultsManager{
    
    private init() {}
    static let standard = UserDefaultsManager() // singleton 패턴
    
    let userDefaults = UserDefaults.standard
    
    enum Key: String{
        case damaName, level, image, nickName
    }
    
    var damaName: String {
        get{
            return userDefaults.string(forKey: Key.damaName.rawValue)!
        }
        set{
            userDefaults.set(newValue, forKey: Key.damaName.rawValue)
        }
    }
    
    var level: Dictionary<String,Int> {
        get{
            return userDefaults.dictionary(forKey: Key.level.rawValue) as? [String:Int] ?? ["level" : 1, "bob" : 0, "water": 0]
        }
        set{
            userDefaults.set(newValue, forKey: Key.level.rawValue)
        }
    }
    
    var image: Array<String> {
        get{
            return userDefaults.array(forKey: Key.image.rawValue) as! [String]
        }
        set{
            userDefaults.set(newValue, forKey: Key.image.rawValue)
        }
    }
    var nickName: String{
        get{
            return userDefaults.string(forKey: Key.image.rawValue) ?? "대장"
        }
        set{
            userDefaults.set(newValue, forKey: Key.image.rawValue)
        }
    }

    
    
    
    
}
