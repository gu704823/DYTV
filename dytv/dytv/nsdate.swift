//
//  nsdate.swift
//  dytv
//
//  Created by jason on 2017/3/29.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
extension NSDate{
    class func getcurrenttime()->String{
     let nsdate = NSDate()
        let timeinterval:Int = Int(nsdate.timeIntervalSince1970)
        return "\(timeinterval)"
    }
}
