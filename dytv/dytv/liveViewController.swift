

import UIKit

class liveViewController: UIViewController {
    
    fileprivate lazy var pagetitlevieww:pagetitleview = {[weak self] in
        let titleframe = CGRect(x: 0, y: kstatusbarh + knavigationh, width: kscreenw, height: 40)
        let titles = ["推荐","游戏","娱乐","趣玩",]
        
        let titleview = pagetitleview(frame: titleframe, titles: titles)
        titleview.backgroundColor = UIColor.white
        //遵循pagetitleview的代理
        titleview.delegate = self
        return titleview
        }()
    
    fileprivate lazy var pagecontentvieww:pagecontentview = {[weak self] in
        //确定内容的frame
        let contentviewframe = CGRect(x: 0, y: kstatusbarh + knavigationh + 40, width: kscreenw, height: kscerrenh - kstatusbarh - knavigationh - 40)
        //确定所有的子控制器
        var childvcs = [UIViewController]()
        for _ in 0...3{
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childvcs.append(vc)
        }
        
        let contenview = pagecontentview(frame: contentviewframe, childcontrollers: childvcs, parentcontrolller: self!)
        //遵循代理
        contenview.delegate = self
        return contenview
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1.设置ui
        setupui()
    }
}

//设置ui界面
extension liveViewController{
    fileprivate func setupui(){
        automaticallyAdjustsScrollViewInsets = false
        //1. 设置导航栏
        setnavigationbar()
        //2.添加titleview
        view.addSubview(pagetitlevieww)
        //3.添加contentview
        view.addSubview(pagecontentvieww)
        
    }
    
    private func setnavigationbar(){
        let size = CGSize(width: 40, height: 40)
        //设置左侧的item
        let btn = UIButton()
        btn.setImage(UIImage(named:"logo"), for: .normal)
        btn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        //设置右侧的item
        let searchitem = UIBarButtonItem.creatitem(imagename: "btn_search", hightimagename: "btn_search_clicked", size:size)
        let historyitem = UIBarButtonItem.creatitem(imagename: "Image_my_history", hightimagename: "Image_my_history_click", size:size)
        let qrcodeitem = UIBarButtonItem.creatitem(imagename: "Image_scan", hightimagename: "Image_scan_click", size:size)
        
        navigationItem.rightBarButtonItems = [searchitem,historyitem,qrcodeitem]
    }
}
//遵循pagetitleviewdelegate代理协议
extension liveViewController:pagetitleviewdelegate{
    func Pagetitleview(titleview: pagetitleview, selectindex index: Int) {
        pagecontentvieww.setcurrentindex(currentindex: index)
    }
}
//遵循pagecontentviewdelegate代理协议
extension liveViewController:pagecontentviewdelegate{
    func Pagecontentview(contentview: pagecontentview, progress: CGFloat, sourceindex: Int, targetindex: Int) {
        pagetitlevieww.settitlewithprogress(progress: progress, sourceindex: sourceindex, targetindex: targetindex)
    }
}
