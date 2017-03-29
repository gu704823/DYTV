//
//  collectionnormalcell.swift
//  dytv
//
//  Created by jason on 2017/3/26.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
import Kingfisher

class collectionnormalcell: UICollectionViewCell {

    @IBOutlet weak var iconimageview: UIImageView!
    @IBOutlet weak var onlinebtn: UIButton!
    @IBOutlet weak var nicknamelabel: UILabel!
    @IBOutlet weak var romnamebtn: UIButton!
    var anchor:anchormodel?{
        didSet{
            guard let anchor  = anchor else{
                return
            }
                //取出在线人数
                let onlineperson:String?
                if anchor.online > 10000{
                    onlineperson = "\(anchor.online/10000)万人在线"
                }else{
                    onlineperson = "\(anchor.online)人在线"
                }
                onlinebtn.setTitle(anchor.room_name, for: .normal)
                nicknamelabel.text = anchor.nickname
                romnamebtn.setTitle(anchor.room_name, for: .normal)
            //设置封面
            guard let imageurl = URL(string:anchor.vertical_src) else {
                return
            }
            iconimageview.kf.setImage(with: imageurl)
            }
        }
    }
    


