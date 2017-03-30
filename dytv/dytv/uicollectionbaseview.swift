//
//  uicollectionbaseview.swift
//  dytv
//
//  Created by jason on 2017/3/29.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class uicollectionbaseviewcell: UICollectionViewCell {
    @IBOutlet weak var iconimageview: UIImageView!
    @IBOutlet weak var nicknamelabel: UILabel!
    @IBOutlet weak var onlinebtn: UIButton!
    var anchor:anchormodel?{
        didSet{
            guard let anchor  = anchor else{
                return
            }
            //取出在线人数
            var onlinepeople:String = ""
            if anchor.online>10000{
                onlinepeople = "\(anchor.online/10000)万人在线"
            }else{
                onlinepeople = "\(anchor.online)人在线"
            }
            onlinebtn.setTitle(onlinepeople, for: .normal)
            nicknamelabel.text = anchor.nickname
            let url = URL(string: anchor.vertical_src)
            iconimageview.kf.setImage(with: url)
        }
    }

}
