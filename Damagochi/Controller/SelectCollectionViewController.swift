//
//  SelectCollectionViewController.swift
//  Damagochi
//
//  Created by 최윤제 on 2022/07/22.
//

import UIKit



class SelectCollectionViewController: UICollectionViewController {
    static let identifier = "SelectCollectionViewController"
    let damagochiInfo = DamagochiInfo()
    var titleName = "다마고치 선택하기"
    var changeMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewLayout()
        navigationItem.title = titleName
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCollectionViewCell.identifier, for: indexPath) as! SelectCollectionViewCell
        
        indexPath.row <= damagochiInfo.damagochi.count - 1 ? cell.setting(data: damagochiInfo.damagochi[indexPath.row]) : cell.setting(data: damagochiInfo.damagochi.last!)
        return cell
    }
    
    func collectionViewLayout(){
        collectionView.backgroundColor = ColorSet.background
        let layout =  UICollectionViewFlowLayout()
        let spacing : CGFloat = 4
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 30, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }

    

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: StartPopupViewController.identifer ) as! StartPopupViewController
        if changeMode{
            vc.startButtonTitle = "변경하기"
        }
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.selectdamagochi = indexPath.row <= damagochiInfo.damagochi.count - 1 ? damagochiInfo.damagochi[indexPath.row] : damagochiInfo.damagochi.last
        
        vc.notMake = indexPath.row  > damagochiInfo.damagochi.count - 2 ? true : false
        
        
        self.present(vc, animated: true)
        
    }

}
