//
//  anchorgroup.swift
//  dytv
//
//  Created by jason on 2017/3/27.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class anchorgroup: NSObject {
    var room_list:[[String:NSObject]]?
    var tag_name:String?
    var icon_url:String = ""
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
