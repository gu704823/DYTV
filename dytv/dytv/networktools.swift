//
//  networktools.swift
//  dytv
//
//  Created by jason on 2017/3/26.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit
import  Alamofire
enum methodtype{
    case post
    case get
}

class networktools {
    class func requestdata(url:String,type:methodtype,parameters:[String:String]? = nil,completion:@escaping (_ result:Any)->()){
        let method = type == methodtype.get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(url, method: method, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else{
                print(response.result.error ?? "error")
                return
            }
            completion(result)
        }
    }
}
