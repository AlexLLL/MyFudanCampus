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
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar()
        
        //设置网页边界
        let screenSize: CGRect = UIScreen.main.bounds
        let myView = UIView(frame: CGRect(x: 0, y: 60, width: screenSize.width, height: screenSize.height-60))
        self.view.addSubview(myView)
        
        //加载页面
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        let configuration  = WKWebViewConfiguration()
        //
        let jscript = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);"
        let userScript = WKUserScript(source: jscript, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        let wkUController = WKUserContentController()
        wkUController.addUserScript(userScript)
        configuration.userContentController = wkUController
        configuration.preferences = preferences
        theWebView = WKWebView(frame : myView.frame, configuration: configuration)
  
        //禁用页面在最顶端时下拉拖动效果
        //theWebView.scrollView.bounces = false
        
        theWebView.load(URLRequest(url : URL (string:"http://www.career.fudan.edu.cn/jsp/career_talk_list.jsp?count=12&list=true")!))
        theWebView.navigationDelegate = self
        view.addSubview(theWebView)
        theWebView.allowsBackForwardNavigationGestures = true
    }
    
    //创建按钮函数
    @objc func goBack() {
        self.theWebView.goBack()
    }
    @objc func home(){
        self.theWebView.load(URLRequest(url : URL (string:"http://www.career.fudan.edu.cn/jsp/career_talk_list.jsp?count=12&list=true")!))
    }
    func navigationBar() {
        //创建导航栏
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: 60))
        self.view.addSubview(navBar);
        navBar.barTintColor = UIColor.black
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        let navigationItem = UINavigationItem(title: "Careers | Fudan");
        navBar.setItems([navigationItem], animated: false);
        
        //创建导航项的按钮
        func showNavigationItem(){
            
            let goBackBtn = UIButton.init()
            let closeBtn = UIButton.init()
            
            goBackBtn.setImage(UIImage.init(named: "NavBack"), for: UIControlState.normal)
            goBackBtn.addTarget(self, action: #selector(goBack), for: UIControlEvents.touchUpInside)
            goBackBtn.sizeToFit()
            let backItem = UIBarButtonItem.init(customView: goBackBtn)
            closeBtn.setTitle("首页", for: UIControlState.normal)
            closeBtn.addTarget(self, action: #selector(home), for: UIControlEvents.touchUpInside)
            closeBtn.sizeToFit()
            let closeItem = UIBarButtonItem.init(customView: closeBtn)
            
            navigationItem.setLeftBarButton(backItem, animated: false)
            navigationItem.setRightBarButton(closeItem, animated: false)
            
        }
        showNavigationItem()
        
        //加载完成时，决定是否显示这两个按钮：
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            
            checkGoBack()
        }
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            
            checkGoBack()
        }
        func checkGoBack(){
            
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = !self.theWebView.canGoBack
            if self.theWebView.canGoBack{
                showNavigationItem()
            }else{
                self.navigationItem.leftBarButtonItems = nil
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

