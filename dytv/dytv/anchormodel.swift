//
//  anchormodel.swift
//  dytv
//
//  Created by jason on 2017/3/27.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class anchormodel: NSObject {
    var nickname:String = ""
    var room_id:Int  = 0
    var online:Int = 0
    var room_name:String = ""
    var vertical_src:String = ""
    var isVertical:Int = 0
    var anchor_city:String = ""
    init(dict:[String:NSObject]){
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
