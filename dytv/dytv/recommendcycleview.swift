//
//  recommendcycleview.swift
//  dytv
//
//  Created by jason on 2017/3/29.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class recommendcycleview: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        autoresizingMask = .init(rawValue: 0)
    }
 

}
extension recommendcycleview{
    class func recommendcyclevieww()->recommendcycleview{
        return Bundle.main.loadNibNamed("recommendcycleview", owner: nil, options: nil)?.first as! recommendcycleview
    }
}
