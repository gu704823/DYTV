//
//  CollectionprettyCell.swift
//  dytv
//
//  Created by jason on 2017/3/26.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionprettyCell: uicollectionbaseviewcell {
    @IBOutlet weak var citybtn: UIButton!
   override var anchor:anchormodel?{
        didSet{
            super.anchor = anchor
            //城市
            citybtn.setTitle(anchor?.anchor_city, for: .normal)
            
        }
    }
  

}
