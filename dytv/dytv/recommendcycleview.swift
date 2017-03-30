//
//  recommendcycleview.swift
//  dytv
//
//  Created by jason on 2017/3/29.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class recommendcycleview: UIView {
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    fileprivate let kcycyleid = "kcycyleid"
    var cyclemodels:[cyclemoedel]?{
        didSet{
            //刷新collectionview
            self.collectionview.reloadData()
            //设置pagecontrol的个数
            self.pagecontrol.numberOfPages = self.cyclemodels?.count ?? 0
            //默认滚到中间的某一位置
            let indexpatch = IndexPath(item: (self.cyclemodels?.count ?? 0) * 6, section: 0)
            collectionview.scrollToItem(at: indexpatch, at: .left, animated: false)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        autoresizingMask = .init(rawValue: 0)
        collectionview.dataSource = self
        collectionview.delegate = self
        //注册cell
       // collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kcycyleid)
        let nib = UINib(nibName: "CollectionViewcycleCell", bundle: nil)
        collectionview.register(nib, forCellWithReuseIdentifier: kcycyleid)
        
    }
    
    override func layoutSubviews() {
        //设置collectionview的layout
        let layout  = collectionview.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionview.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.isPagingEnabled = true
        
    }
 

}
extension recommendcycleview{
    class func recommendcyclevieww()->recommendcycleview{
        return Bundle.main.loadNibNamed("recommendcycleview", owner: nil, options: nil)?.first as! recommendcycleview
    }
}

extension recommendcycleview:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (cyclemodels?.count ?? 0) * 10000
      
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: kcycyleid, for: indexPath) as! CollectionViewcycleCell
        //取余数实现无线轮播
        let cyclemodel  = cyclemodels?[indexPath.item%cyclemodels!.count]
       
        cell.cyclemodel = cyclemodel
        //print("item为\(indexPath.item),余数为\(indexPath.item%(cyclemodels?.count)!)")
        return cell
    }
}
extension recommendcycleview:UICollectionViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetx = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        let currentindex = offsetx/scrollView.bounds.width
        //取余数实现无线轮播
        pagecontrol.currentPage = Int(currentindex) % (cyclemodels?.count)!
    }
}
