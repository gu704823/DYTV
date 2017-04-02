//
//  CollectionViewgameCell.swift
//  dytv
//
//  Created by jason on 2017/4/2.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewgameCell: UICollectionViewCell {

    @IBOutlet weak var gameimage: UIImageView!
    @IBOutlet weak var gamename: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        gameimage.layer.cornerRadius = 25
        gameimage.layer.masksToBounds = true
    }
    var gamegroup:anchorgroup?{
        didSet{
          
            gamename.text = gamegroup?.tag_name
            let url = URL(string: gamegroup?.icon_url ?? "")
            gameimage.kf.setImage(with: url)
        }
    }

}
