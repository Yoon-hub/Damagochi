//
//  ReuseableViewProtocol.swift
//  Damagochi
//
//  Created by 최윤제 on 2022/08/01.
//

import Foundation
import UIKit

protocol ReuseableViewProtocol{
    static var reuseidetifier : String { get }
}

extension UIViewController: ReuseableViewProtocol{
    static var reuseidetifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReuseableViewProtocol{
    static var reuseidetifier: String {
        return String(describing: self)
    }
}

