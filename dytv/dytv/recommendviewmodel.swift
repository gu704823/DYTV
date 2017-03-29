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
    lazy var anchorgroups:[anchorgroup] = [anchorgroup]()
    fileprivate let prittygroup = anchorgroup()
    fileprivate let hotgroup = anchorgroup()
}
extension recommendviewmodel{
    func requestdata(completion:@escaping ()->()){
        let parameters = ["limit":"4","offset":"0","date":NSDate.getcurrenttime()]
        let disgroup = DispatchGroup()
        //1.请求最热数据
        disgroup.enter()
        networktools.requestdata(url: "https://capi.douyucdn.cn/api/v1/getbigDataRoom", type: .get, parameters: parameters) { (result) in
            guard let resultdict = result as? [String:NSObject] else{
                return
            }
            guard let dataarry = resultdict["data"] as?[[String:NSObject]] else{
                return
            }
            self.hotgroup.tag_name = "热门"
            self.hotgroup.icon_url = ""
            for dict in dataarry{
                let anchor = anchormodel(dict: dict)
                self.hotgroup.anchors.append(anchor)
            }
          disgroup.leave()
        }
        disgroup.enter()
        //3.请求颜值数据
        networktools.requestdata(url: "https://capi.douyucdn.cn/api/v1/getVerticalRoom", type: .get,parameters: parameters) { (result) in
            guard let resultdict = result as? [String:NSObject] else {return}
            guard let dataarry = resultdict["data"] as?[[String:NSObject]] else {return}
            self.prittygroup.tag_name = "颜值"
            self.prittygroup.icon_url = ""
            for dict in dataarry{
                let anchor = anchormodel(dict: dict)
                self.prittygroup.anchors.append(anchor)
            }
            disgroup.leave()
        }
        disgroup.enter()
        //4.英雄联盟--风暴英雄(10组数据)
        networktools.requestdata(url: "https://capi.douyucdn.cn/api/v1/getHotCate", type: .get,parameters: parameters) { (result) in
            guard let resultdict = result as? [String:NSObject] else {return}
            guard let dataarry = resultdict["data"] as?[[String:NSObject]] else {return}
            for dict in dataarry{
            let dataarry = anchorgroup(dict: dict)
            self.anchorgroups.append(dataarry)
        }
            disgroup.leave()
    }
      disgroup.notify(queue: DispatchQueue.main) {
        self.anchorgroups.insert(self.prittygroup, at: 0)
        self.anchorgroups.insert(self.hotgroup, at: 0)
        completion()
        }
 }
}


//scrollview(6组数据)
//https://capi.douyucdn.cn/api/v1/slide/6?version=2.461&client_sys=ios
//最热
//https://capi.douyucdn.cn/api/v1/getbigDataRoom?client_sys=ios

//颜值
//https://capi.douyucdn.cn/api/v1/getVerticalRoom?limit=4&client_sys=ios&offset=0
//英雄联盟--风暴英雄(10组数据)
//https://capi.douyucdn.cn/api/v1/getHotCate?aid=ios&client_sys=ios&time=1490540640&auth=22e5e371bbead8aa48389e4113b42f66
