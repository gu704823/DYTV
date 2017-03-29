//
//  collectionnormalcell.swift
//  dytv
//
//  Created by jason on 2017/3/26.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
import Kingfisher

class collectionnormalcell: uicollectionbaseviewcell {
   
    @IBOutlet weak var romnamelabel: UILabel!
  
    override var anchor:anchormodel?{
        didSet{
            super.anchor = anchor
            romnamelabel.text = anchor?.room_name
            
}
}
}
    


