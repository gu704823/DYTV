//
//  cyclemodel.swift
//  dytv
//
//  Created by jason on 2017/3/30.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
class cyclemoedel:NSObject{
    var title:String = ""
    var pic_url:String = ""
    var anchor:anchormodel?
    var room:[String:NSObject]?{
        didSet{
            guard let room = room else {
                return
            }
           anchor = anchormodel(dict: room)
        }
    }
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
