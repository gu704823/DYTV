//
//  CollectionprettyCell.swift
//  dytv
//
//  Created by jason on 2017/3/26.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionprettyCell: UICollectionViewCell {
    
    @IBOutlet weak var iconimageview: UIImageView!
    @IBOutlet weak var nicknamelabel: UILabel!
    @IBOutlet weak var citybtn: UIButton!
    @IBOutlet weak var onlinebtn: UIButton!
 
    var anchor:anchormodel?{
        didSet{
            //校验anchor是否有值
            guard let anchor = anchor else {
                return
            }
            //取出在线人数
            let onlineperson:String?
            if anchor.online > 10000{
                onlineperson = "\(anchor.online/10000)万人在线"
            }else{
                onlineperson = "\(anchor.online)人在线"
            }
            onlinebtn.setTitle(onlineperson, for: .normal)
            //主播名字
            nicknamelabel.text = anchor.nickname
            //城市
            citybtn.setTitle(anchor.anchor_city, for: .normal)
            //设置封面
            guard let iconurl = URL(string: anchor.vertical_src) else{
                return
            }
            iconimageview.kf.setImage(with: iconurl)
        }
    }
  

}
