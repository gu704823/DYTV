//
//  CollectionheaderView.swift
//  dytv
//
//  Created by jason on 2017/3/26.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionheaderView: UICollectionReusableView {

    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var iconimageview: UIImageView!
    var group:anchorgroup?{
        didSet{
            guard  let group = group else {
                return
            }
            titlelabel.text = group.tag_name
            guard let url = URL(string: group.icon_url)  else {
                iconimageview.image = UIImage(named: "home_header_hot")
                return
            }
            iconimageview.kf.setImage(with: url)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
