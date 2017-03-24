//
//  uicolor.swift
//  dytv
//
//  Created by jason on 2017/3/24.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
    }

