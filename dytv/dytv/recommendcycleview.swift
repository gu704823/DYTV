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
    
    var cycletimer:Timer?
    var cyclemodels:[cyclemoedel]?{
        didSet{
            self.collectionview.reloadData()
            //设置pagecontrol的个数
            pagecontrol.numberOfPages = cyclemodels?.count ?? 0
            //默认滚到中间的某一位置
            
            let indexpatch = IndexPath(item: (cyclemodels?.count ?? 0) * 6, section: 0)
           // collectionview.scrollToItem(at: indexpatch, at: .top, animated: false)
             //collectionview.scrollToItem(at: indexpatch, at: .left, animated: false)
            collectionview.scrollToItem(at: indexpatch, at: .left, animated: false)
            
            
            removecycletimer()
            cereattimer()
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
        //layout.scrollDirection = .horizontal
        //collectionview.showsHorizontalScrollIndicator = false
        layout.scrollDirection = .vertical
        collectionview.showsVerticalScrollIndicator = false
        collectionview.isPagingEnabled = true
        
        
        
        
        
    }
 
}
//提供快速创建类方法
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
//检测用户拖拽停止开始计时器
extension recommendcycleview:UICollectionViewDelegate{
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removecycletimer()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        cereattimer()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsety = scrollView.contentOffset.y + scrollView.bounds.height * 0.5
        let currentindey = offsety/scrollView.bounds.height
        pagecontrol.currentPage = Int(currentindey) % (cyclemodels?.count)!
       // let offsetx = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
       // let currentindex = offsetx/scrollView.bounds.width
        //取余数实现无线轮播
        //pagecontrol.currentPage = Int(currentindex) % (cyclemodels?.count)!
    }
}
//定时器的操作方法
extension recommendcycleview{
    
    //创建定时器
    fileprivate func cereattimer(){
        cycletimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrolltonext), userInfo: nil, repeats: true)
    }
    //移除定时器
   fileprivate func removecycletimer(){
        cycletimer?.invalidate()
        cycletimer = nil
    }
    //视图滚动
    @objc fileprivate func scrolltonext(){
       let currentoffsety = collectionview.contentOffset.y
        let offsety = currentoffsety + collectionview.bounds.height
        collectionview.setContentOffset(CGPoint(x:0,y:offsety), animated: true)
        
        //动画
        let animx  = CABasicAnimation(keyPath: "transform.rotation.x")
        animx.fromValue = 0
        animx.toValue  = M_PI*0.5
        animx.duration = 1.5
        collectionview.layer.add(animx, forKey: nil)
        let animx1  = CABasicAnimation(keyPath: "transform.rotation.x")
        animx1.fromValue = M_PI*0.5
        animx1.toValue  = 0
        animx1.duration = 1.5
        collectionview.layer.add(animx1, forKey: nil)
        
        

    }
}
