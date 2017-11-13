//
//  FirstViewController.swift
//  MyFudanCampus
//
//  Created by alex on 2017/11/13.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//



import UIKit
import WebKit

class FirstViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
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
        let frame = CGRect(x:0, y:100, width:UIScreen.main.bounds.width + 500, height:UIScreen.main.bounds.height + 1500)
        let theWebView:WKWebView = WKWebView(frame:frame)
        
        //禁用页面在最顶端时下拉拖动效果
        theWebView.scrollView.bounces = false
        //加载页面
        let url = URL(string:"http://www.career.fudan.edu.cn/jsp/career_talk_list.jsp?count=12&list=true")
        let request = URLRequest(url:url!)
        theWebView.load(request)
        self.view.addSubview(theWebView)
        
        
    }

    
    @IBAction func onBackButton_Clicked(sender: UIButton)
    {
        if(theWebView.canGoBack)
        {
            theWebView.goBack()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

