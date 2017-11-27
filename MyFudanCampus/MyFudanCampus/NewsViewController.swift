//
//  NewsViewController.swift
//  MyFudanCampus
//
//  Created by alex on 2017/11/26.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//


import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var newsTableView: UITableView!
    var resultArray = NSMutableArray()
    var htmlStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar()
        
        getforData { getString in
            // and here you get the "returned" value from the asynchronous task
            self.htmlStr = getString
            let newsArray = NSMutableArray()
            
            let pattern1 = "(1\" title=\")(.*?)(\">)"
            let matched1 = self.matches(for: pattern1, in: self.htmlStr)
            let pattern2 = "(m3\">)(.*?)(</)"
            let matched2 = self.matches(for: pattern2, in: self.htmlStr)
            let pattern3 = "(5\" title=\")(.*?)(\">)"
            let matched3 = self.matches(for: pattern3, in: self.htmlStr)
            let pattern4 = "(m4\">)(.*?)(</)"
            let matched4 = self.matches(for: pattern4, in: self.htmlStr)
            
            var i = 0
            while i<matched1.count {
                let model:newsModel = newsModel()
                let start1 = matched1[i].index(matched1[i].startIndex, offsetBy: 10)  //索引从开始偏移X个位置
                let start2 = matched2[i].index(matched2[i].startIndex, offsetBy: 4)
                let start3 = matched1[i].index(matched1[i].startIndex, offsetBy: 10)
                let start4 = matched2[i].index(matched2[i].startIndex, offsetBy: 4)
                let end1 = matched1[i].index(matched1[i].endIndex, offsetBy: -2) //所有从末尾往回偏移X个位置
                let end2 = matched2[i].index(matched2[i].endIndex, offsetBy: -2)
                let end3 = matched3[i].index(matched3[i].endIndex, offsetBy: -2)
                let end4 = matched4[i].index(matched4[i].endIndex, offsetBy: -2)
                let range1 = start1..<end1
                let range2 = start2..<end2
                let range3 = start3..<end3
                let range4 = start4..<end4
                model.name = String(matched1[i][range1])
                model.date = String(matched2[i][range2])+" "+String(matched4[i][range4])
                model.location = String(matched3[i][range3])
                newsArray.add(model)
                i = i+1
            }
            self.resultArray = newsArray
            DispatchQueue.main.async {
                self.newsTableView.dataSource = self
                self.newsTableView.delegate = self
                self.newsTableView.reloadData()
            }
        }
        
        
    }
    
    func getforData(completion:  @escaping (String) -> ()) {
        if let url = URL(string: "http://www.career.fudan.edu.cn/jsp/career_talk_list.jsp?count=50&list=true") {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) {
                data, response, error in
                if let data = data, let getString = String(data: data, encoding: String.Encoding.utf8), error == nil {
                    completion(getString)
                } else {
                    print("error=\(error!.localizedDescription)")
                }
            }
            task.resume()
        }
    }
    //正则匹配函数，返回的是一个String数组
    func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let nsString = text as NSString
            let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsTableViewCell")as! newsTableViewCell
        var cellModel = newsModel()
        cellModel = resultArray.object(at: indexPath.row) as! newsModel
        cell.name.text! = cellModel.name
        cell.date.text! = cellModel.date
        cell.location.text! = cellModel.location
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: 224/255, green: 238/255, blue: 238/255, alpha: 0.5)
        } else {
            cell.backgroundColor = UIColor.white
        }
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
