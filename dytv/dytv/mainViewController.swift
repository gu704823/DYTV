//
//  mainViewController.swift
//  dytv
//
//  Created by jason on 2017/3/23.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class mainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addchildviewcontroller(name: "home")
        addchildviewcontroller(name: "live")
        addchildviewcontroller(name: "follow")
        addchildviewcontroller(name: "profile")
      
        
    }

    private func addchildviewcontroller(name:String){
        //通过storyboard获取子控制器
        let chidvc = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()!
        
        addChildViewController(chidvc)
    }
}
