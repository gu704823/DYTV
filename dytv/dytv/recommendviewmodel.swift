//
//  recommendviewmodel.swift
//  dytv
//
//  Created by jason on 2017/3/26.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class recommendviewmodel {
//属性
    fileprivate lazy var anchorgroups:[anchorgroup] = [anchorgroup]()
}
extension recommendviewmodel{
    func requestdata(){
        //1.请求最热数据
        //2.请求手游数据
        //3.请求颜值数据
        //4.英雄联盟--风暴英雄(10组数据)
        networktools.requestdata(url: "https://capi.douyucdn.cn/api/v1/getHotCate?aid=ios&client_sys=ios&time=1490540640&auth=22e5e371bbead8aa48389e4113b42f66", type: .get) { (result) in
            guard let resultdict = result as? [String:NSObject] else {return}
            guard let dataarry = resultdict["data"] as?[[String:NSObject]] else {return}
            for dict in dataarry{
            let dataarry = anchorgroup(dict: dict)
            self.anchorgroups.append(dataarry)
        }
            for group in self.anchorgroups{
                print(group.icon_url ?? 0)
            }
    }
 }
}


//scrollview(6组数据)
//https://capi.douyucdn.cn/api/v1/slide/6?version=2.461&client_sys=ios
//最热
//https://capi.douyucdn.cn/api/v1/getbigDataRoom?client_sys=ios
//手游
//https://apiv2.douyucdn.cn/Live/Roomlist/getMobileGameRoomList?limit=4&client_sys=ios&offset=0
//颜值
//https://capi.douyucdn.cn/api/v1/getVerticalRoom?limit=4&client_sys=ios&offset=0
//英雄联盟--风暴英雄(10组数据)
//https://capi.douyucdn.cn/api/v1/getHotCate?aid=ios&client_sys=ios&time=1490540640&auth=22e5e371bbead8aa48389e4113b42f66
