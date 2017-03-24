//
//  pagetitleview.swift
//  dytv
//
//  Created by jason on 2017/3/23.
//  Copyright © 2017年 jason. All rights reserved.
//

import UIKit

class pagetitleview: UIView {
    fileprivate var titles:[String]
    init(frame: CGRect,titles:[String]) {
        self.titles = titles
        super.init(frame: frame)
        //1.设置ui
        setupui()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    fileprivate lazy var labeltitles = [UILabel]()
    //设置scrollview
    fileprivate lazy var scrollview:UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.scrollsToTop = false
        scrollview.bounces = false
        return scrollview
        
    }()
    //设置scrollline
    fileprivate lazy var scrollline:UIView = {
        let scrollline = UIView()
        scrollline.backgroundColor = UIColor.orange
        return scrollline
    
    }()
}


extension pagetitleview{
    fileprivate func setupui(){
        //1.添加scrollview
      scrollview.frame = bounds
      addSubview(scrollview)
        //2.添加title对应的label
        setuptitlelabels()
        //3.添加底线和滚动的滑块
        bottomlineandscrollline()
    }
   
}


extension pagetitleview{
    fileprivate func setuptitlelabels(){
        for (index,title) in titles.enumerated(){
            let label = UILabel()
            
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.black
            label.textAlignment = .center
            
            let labelw:CGFloat = frame.width/CGFloat(titles.count)
            let labelh:CGFloat = frame.height - 2
            let labelx:CGFloat = labelw * CGFloat(index)
            let labely:CGFloat = 0
            label.frame = CGRect(x: labelx, y: labely, width: labelw, height: labelh)
            
            scrollview.addSubview(label)
            labeltitles.append(label)
            
            //给label添加手势
            label.isUserInteractionEnabled = true
            let tapges = UITapGestureRecognizer(target: self, action: #selector(self.titlelabelclick(tap:)))
            label.addGestureRecognizer(tapges)
        }
    }
    fileprivate func bottomlineandscrollline(){
        let bottomline = UIView()
        bottomline.backgroundColor = UIColor.gray
        let lineh:CGFloat = 0.5
        bottomline.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: lineh)
        //1.添加底线
        addSubview(bottomline)
        //2.添加scrollline
        //2.1获取第一个label
        guard  let firstlabel = labeltitles.first else {
            return
        }
        firstlabel.textColor = UIColor.orange
        
        scrollline.frame = CGRect(x: firstlabel.frame.origin.x, y: firstlabel.frame.height, width: firstlabel.frame.width, height: 2)
        scrollview.addSubview(scrollline)
        
        
    }
}
extension pagetitleview{
    @objc fileprivate func titlelabelclick(tap:UITapGestureRecognizer){
        print("---")
    }
}

