//
//  gameViewController.swift
//  dytv
//
//  Created by jason on 2017/4/3.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

//定义属性
 private let cellid = "gamecellid"
private let margin:CGFloat = 10.0
private let itemw:CGFloat = (kscreenw - 2*margin)/3
private let itemh:CGFloat = 4/3 * itemw

class gameViewController: UIViewController {
    //懒加载属性
    fileprivate lazy var collectionview:UICollectionView = {[unowned self]in
        //创建collectionview的layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemw, height: itemh)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        //创建collectionview
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionview.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        //遵循代理
        collectionview.dataSource = self
        collectionview.delegate = self
        //注册cell
        let nib = UINib(nibName: "CollectionViewgameCell", bundle: nil)
        collectionview.register(nib, forCellWithReuseIdentifier: cellid)
        
        return collectionview
    }()
    //系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
    //1.设置ui
      setupui()
      
    }


}
//设置ui
extension gameViewController{
    fileprivate func setupui(){
        view.addSubview(collectionview)
    }
    
}
//遵循数据源,代理
extension gameViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
        cell.backgroundColor = UIColor.white
        return cell
    }
    
}

