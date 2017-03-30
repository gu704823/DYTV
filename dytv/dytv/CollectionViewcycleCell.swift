//
//  CollectionViewcycleCell.swift
//  dytv
//
//  Created by jason on 2017/3/30.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewcycleCell: UICollectionViewCell {
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var title: UILabel!

    var cyclemodel:cyclemoedel?{
        didSet{
            
            title.text = cyclemodel?.title
            let url = URL(string: cyclemodel?.pic_url ?? "")!
            imageview.kf.setImage(with: url)
        }
    }

}
