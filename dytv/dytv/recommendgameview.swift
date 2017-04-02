//
//  recommendgameview.swift
//  dytv
//
//  Created by jason on 2017/4/2.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class recommendgameview: UIView {
    @IBOutlet weak var collectionview: UICollectionView!
    
    fileprivate let gamecellid = "gamecellid"
    var gamegroups:[anchorgroup]?{
        didSet{
            
           
            gamegroups?.remove(at: 0)
            gamegroups?.remove(at: 0)
            
            
            collectionview.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        //控件不随父控件的拉伸而拉伸
        autoresizingMask = UIViewAutoresizing.init(rawValue: 0)
        //遵循代理
        collectionview.dataSource = self
        //注册cell
        collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: gamecellid)
        let nib = UINib(nibName: "CollectionViewgameCell", bundle: nil)
        collectionview.register(nib, forCellWithReuseIdentifier: gamecellid)
    }
   
    //对collectionview进行布局
    override func layoutSubviews() {
        let layout = collectionview.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 80, height: 90)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
    }

}
//快速创建类方法(view)
extension recommendgameview{
    class func recommendgameview()->recommendgameview{
        return Bundle.main.loadNibNamed("recommendgameview", owner: nil, options: nil)?.first as! recommendgameview
    }
}
//实现数据源代理
extension recommendgameview:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gamegroups?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gamecellid, for: indexPath) as! CollectionViewgameCell
        let group = gamegroups?[indexPath.item]
        cell.gamegroup = group
        return cell
    }
}



