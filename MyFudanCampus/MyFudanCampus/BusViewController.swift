//
//  BusViewController.swift
//  MyFudanCampus
//
//  Created by alex on 2017/12/16.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON

class BusViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var busTableView: UITableView!
    var busArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar()
        
        //1 获取json文件路径
        let path = Bundle.main.path(forResource: "bus", ofType: "json")
        //2 获取json文件里面的内容,NSData格式
        let url = URL(fileURLWithPath: path!)
        do {
            let data = try Data(contentsOf: url)
            let json = try JSON(data: data)
            var i = 0;
            while i < json.count {
                let model:busModel = busModel()
                model.time1 = json[i]["time1"].string!
                model.to = json[i]["to"].string!
                model.time2 = json[i]["time2"].string!
                //print(model.time1, model.to, model.time2)
                busArray.add(model)
                i = i+1
            }
            
        }
        catch {}

        
        self.busTableView.dataSource = self
        self.busTableView.delegate = self
        self.busTableView.reloadData()
    }

    func navigationBar() {
        //创建导航栏
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: 60))
        self.view.addSubview(navBar);
        navBar.barTintColor = UIColor.black
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        let navigationItem = UINavigationItem(title: "Bus | Service");
        navBar.setItems([navigationItem], animated: false);
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "busTableViewCell")as! busTableViewCell
        var cellModel = busModel()
        cellModel = busArray.object(at: indexPath.row) as! busModel
        cell.time1.text! = cellModel.time1
        cell.to.text! = cellModel.to
        cell.time2.text! = cellModel.time2
        self.busTableView.rowHeight = 22;
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: 30/255, green: 144/255, blue: 255/255, alpha: 0.1)
        } else {
            cell.backgroundColor = UIColor.white
        }
        return cell
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
