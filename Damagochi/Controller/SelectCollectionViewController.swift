//
//  SelectCollectionViewController.swift
//  Damagochi
//
//  Created by 최윤제 on 2022/07/22.
//

import UIKit



class SelectCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewLayout()
        view.backgroundColor = ColorSet.background

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let damagochiInfo = DamagochiInfo()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectCollectionViewCell", for: indexPath) as! SelectCollectionViewCell
        
        if indexPath.row <= 2{
            cell.setting(data: damagochiInfo.damagochi[indexPath.row])
        } else {
            cell.setting(data: damagochiInfo.damagochi.last!)
        }
        return cell
    }
    
    func collectionViewLayout(){
        
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


}
