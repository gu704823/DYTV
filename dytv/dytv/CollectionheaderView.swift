//
//  CollectionheaderView.swift
//  dytv
//
//  Created by jason on 2017/3/26.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class CollectionheaderView: UICollectionReusableView {

    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var iconimageview: UIImageView!
    var group:anchorgroup?{
        didSet{
            titlelabel.text = group?.tag_name
            iconimageview.image = UIImage(named:group?.icon_url ?? "")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
