//
//  AppDelegate.swift
//  dy/Users/airbook/Desktop/dytv/dytv/dytv.xcodeprojtv
//
//  Created by jason on 2017/3/23.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
import LeanCloud

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //切换leancloud的节点,默认中国
        LeanCloud.setServiceRegion(.cn)
        //注册leancloud
        LeanCloud.initialize(applicationID: "VuAJiOQ8VN3afCHxDWdMdm3f-gzGzoHsz", applicationKey: "FQQrzhHuwYtlHjDN090T7NNk")
        //设置tabbar的颜色
        UITabBar.appearance().tintColor = UIColor.orange
        return true
    }

    

}

