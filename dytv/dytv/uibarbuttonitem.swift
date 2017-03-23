//
//  uibarbuttonitem.swift
//  dytv
//
//  Created by jason on 2017/3/23.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
     class func creatitem(imagename:String,hightimagename:String,size:CGSize)->UIBarButtonItem{
        let btn = UIButton()
        btn.setImage(UIImage(named:imagename), for: .normal)
        btn.setImage(UIImage(named:hightimagename), for: .highlighted)
        btn.frame = CGRect(origin:.zero, size: size)
        return UIBarButtonItem(customView: btn)
    }
}
