//
//  mainViewController.swift
//  dytv
//
//  Created by jason on 2017/3/23.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
import LeanCloud

class mainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addchildviewcontroller(name: "home")
        addchildviewcontroller(name: "live")
        addchildviewcontroller(name: "follow")
        addchildviewcontroller(name: "profile")
        
        
        
        
        //测试leancloud
        let post = LCObject(className: "testobject")
        post.set("words", value: "helloword")
        post.save()
      
        
    }

    private func addchildviewcontroller(name:String){
        //通过storyboard获取子控制器
        let chidvc = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()!
        
        addChildViewController(chidvc)
    }
}
