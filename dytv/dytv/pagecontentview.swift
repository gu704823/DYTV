//
//  pagecontentview.swift
//  dytv
//
//  Created by jason on 2017/3/24.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
let contentcellid = "contentcellid"
class pagecontentview: UIView {
    fileprivate var childviewcontrollers:[UIViewController]
    fileprivate weak var parentviewcontroller:UIViewController?
    

    init(frame:CGRect,childcontrollers:[UIViewController],parentcontrolller:UIViewController?){
        self.childviewcontrollers = childcontrollers
        self.parentviewcontroller = parentcontrolller
        super.init(frame:frame)
        //设置ui
        setupui()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var collectionview:UICollectionView = {
        //创建layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        //创建uicollectionview
        let collectionview = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.bounces = false
        collectionview.isPagingEnabled = true
        
        collectionview.dataSource = self
        //注册cell
        collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: contentcellid)
        return collectionview
    
    }()

}
extension pagecontentview{
    fileprivate func setupui(){
        //1.将所有的子控制器添加到父控制器中
        for childvc in childviewcontrollers{
            parentviewcontroller?.addChildViewController(childvc)
        }
        collectionview.frame = bounds
        addSubview(collectionview)
    }
}

extension pagecontentview:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childviewcontrollers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: contentcellid, for: indexPath)
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        let childvc = childviewcontrollers[indexPath.item]
        childvc.view.frame  = cell.contentView.bounds
        cell.contentView.addSubview(childvc.view)
        return cell
        
    }
    
}
