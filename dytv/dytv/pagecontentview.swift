//
//  pagecontentview.swift
//  dytv
//
//  Created by jason on 2017/3/24.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
protocol pagecontentviewdelegate:class {
    func Pagecontentview(contentview:pagecontentview,progress:CGFloat,sourceindex:Int,targetindex:Int)
}
let contentcellid = "contentcellid"
class pagecontentview: UIView {
    fileprivate var childviewcontrollers:[UIViewController]
    fileprivate weak var parentviewcontroller:UIViewController?
    fileprivate var startoffsetx:CGFloat = 0
    weak var delegate:pagecontentviewdelegate?
    
    var isforbidscrolldelegate:Bool = false

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
    //创建collectionview
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
        collectionview.delegate = self
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
//遵循collectionview的数据源方法
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
//遵循collectionview的代理
extension pagecontentview:UICollectionViewDelegate{
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //在未滑动之前重新把isforbidscrolldelegate赋值为false
        isforbidscrolldelegate = false
        startoffsetx = scrollView.contentOffset.x
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //判断是点击还是滑动,如果是true则不执行scrollViewDidScroll这个方法,直接return
        if isforbidscrolldelegate {return}
        //定义需要的数据
        var progress:CGFloat = 0
        var sourceindex:Int = 0
        var targetindex:Int = 0
        //2.判断是左滑还是右滑
        let currentoffsetx = scrollView.contentOffset.x
        let scrollvieww = scrollView.bounds.width
        
        if currentoffsetx>startoffsetx{
            //左滑
            //1.计算progress
            progress = currentoffsetx/scrollvieww - floor(currentoffsetx/scrollvieww)
            //2.计算sourceindex
            sourceindex = Int(currentoffsetx/scrollvieww)
            //3.计算targetindex
            targetindex = sourceindex + 1
            if targetindex>=childviewcontrollers.count {
                targetindex = childviewcontrollers.count - 1
            }
            //4.如果完全滑过去
            if currentoffsetx - startoffsetx == scrollvieww{
                progress = 1
                targetindex = sourceindex
            }
            
        }else{
            //右滑
            //1.计算progress
            progress = 1-(currentoffsetx/scrollvieww - floor(currentoffsetx/scrollvieww))
            //2.计算targetindex
            targetindex = Int(currentoffsetx/scrollvieww)
            //3.计算sourceindex
            sourceindex = targetindex + 1
            if sourceindex>=childviewcontrollers.count{
                sourceindex = childviewcontrollers.count - 1
            }
        }
        //通知代理
        delegate?.Pagecontentview(contentview: self, progress: progress, sourceindex: sourceindex, targetindex: targetindex)
    }
}
//对外暴露的方法,允许调用
extension pagecontentview{
    func setcurrentindex(currentindex:Int){
        //如果是点击,isforbidscrolldelegate为true
        isforbidscrolldelegate = true
        let offsetx = CGFloat(currentindex) * collectionview.frame.width
        collectionview.setContentOffset(CGPoint(x:offsetx,y:0), animated: true)
    }
}
