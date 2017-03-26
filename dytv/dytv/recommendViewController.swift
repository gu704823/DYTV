//
//  recommendViewController.swift
//  dytv
//
//  Created by jason on 2017/3/25.
//  Copyright © 2017年 jason. All rights reserved.
//
import UIKit

//定义属性
private let kitemmargin:CGFloat = 10
private let kitemw = (kscreenw - 3 * kitemmargin)/2
private let knormalitemh = 3/4 * kitemw
private let kprittyitemh = 4/3 * kitemw
private let kheaderviewh:CGFloat = 50
private let normalcellid = "normalcellid"
private let prittycellid = "prittycellid"
private let headerid = "headerid"

class recommendViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
      //1.设置ui
        setupui()
        
    }
    //懒加载collectionview
    fileprivate lazy var collectionvieww:UICollectionView = {
      //1.创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kitemw, height: kprittyitemh)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kitemmargin
        layout.headerReferenceSize = CGSize(width: kscreenw, height: kheaderviewh)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kitemmargin, bottom: 0, right: kitemmargin)
        
    //2.创建collectionview
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionview.backgroundColor = UIColor.white
        
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        //collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellid)
        //注册cell
        collectionview.register(UINib(nibName: "collectionnormalcell", bundle: nil), forCellWithReuseIdentifier: normalcellid)
        collectionview.register(UINib(nibName: "CollectionprettyCell", bundle: nil), forCellWithReuseIdentifier: prittycellid)
        //collectionview.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerid)
        //注册header
        collectionview.register(UINib(nibName: "CollectionheaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerid)
        return collectionview
    
    }()
}
//设置ui界面内容
extension recommendViewController{
    fileprivate func setupui(){
       //1.将collectionview添加到view中
        view.addSubview(collectionvieww)
        
       
    }
    
}
//遵守数据源协议UICollectionViewDataSource
extension recommendViewController:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 8
        }else{
            return 4
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell:UICollectionViewCell!
        if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: prittycellid, for: indexPath)
        }else{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: normalcellid, for: indexPath)
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerid, for: indexPath)
       return headerview
    
   }
}
//遵守UICollectionViewDelegateFlowLayout
extension recommendViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 1{
            return CGSize(width: kitemw, height: kprittyitemh)
        }else{
            return CGSize(width: kitemw, height: knormalitemh)
        }
    }
}
