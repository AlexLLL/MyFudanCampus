//
//  ThirdViewController.swift
//  MyFudanCampus
//
//  Created by alex on 2017/11/13.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

import UIKit
import WebKit

class ThirdViewController: UIViewController, WKUIDelegate {
    var theWebView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        theWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        theWebView.uiDelegate = self
        view = theWebView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //将浏览器视图全屏(在内容区域全屏,不占用顶端时间条)
        let frame = CGRect(x:0, y:20, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
        let theWebView:WKWebView = WKWebView(frame:frame)
        //禁用页面在最顶端时下拉拖动效果
        theWebView.scrollView.bounces = false
        //加载页面
        let url = URL(string:"https://bbs.fudan.edu.cn/m/bbs/boa?s=B")
        let request = URLRequest(url:url!)
        theWebView.load(request)
        self.view.addSubview(theWebView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

