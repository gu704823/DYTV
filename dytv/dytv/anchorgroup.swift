//
//  anchorgroup.swift
//  dytv
//
//  Created by jason on 2017/3/27.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class anchorgroup: NSObject {
    lazy var anchors:[anchormodel] = [anchormodel]()
    var room_list:[[String:NSObject]]?{
        didSet{
            guard let romlist = room_list else{
                return
            }
            for dict in romlist{
               let data = anchormodel(dict: dict)
               anchors.append(data)
            }
        }
    }
    var tag_name:String?
    var icon_url:String = ""
    
    override init() {
        
    }
    
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
