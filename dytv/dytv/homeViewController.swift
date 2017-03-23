//
//  homeViewController.swift
//  dytv
//
//  Created by jason on 2017/3/23.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //1.设置ui
        setupui()

       
    }

    
}

//设置ui界面
extension homeViewController{
    fileprivate func setupui(){
        //1. 设置导航栏
        setnavigationbar()
    }
    
    private func setnavigationbar(){
        let size = CGSize(width: 40, height: 40)
        //设置左侧的item
        let btn = UIButton()
        btn.setImage(UIImage(named:"logo"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        //设置右侧的item
        let searchitem = UIBarButtonItem.creatitem(imagename: "btn_search", hightimagename: "btn_search_clicked", size:size)
        let historyitem = UIBarButtonItem.creatitem(imagename: "Image_my_history", hightimagename: "Image_my_history_click", size:size)
        let qrcodeitem = UIBarButtonItem.creatitem(imagename: "Image_scan", hightimagename: "Image_scan_click", size:size)

        navigationItem.rightBarButtonItems = [searchitem,historyitem,qrcodeitem]
    }
}
