//
//  DetailViewController.swift
//  MyFudanCampus
//
//  Created by alex on 2017/11/17.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //var lineChartEntry = [ChartDataEntry]()
    var cellShow = resultModel()
    
    @IBOutlet weak var creditPoint: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var semesterName: UILabel!
    @IBOutlet weak var lessonCode: UILabel!
    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var totalStudentNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lessonName.text! = cellShow.lessonName
        lessonCode.text! = String(cellShow.lessonCode)
        semesterName.text! = cellShow.semesterName
        let teacher = "教师："+cellShow.teacherName
        teacherName.text! = teacher
        let credit = "学分："+String(cellShow.creditPoint)
        creditPoint.text! = credit
        let number = "总人数："+String(cellShow.totalStudentNumber)
        totalStudentNumber.text! = number
        let scoreArray = cellShow.scoreArray
        // Do any additional setup after loading the view.
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
