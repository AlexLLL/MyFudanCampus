//
//  SecondViewController.swift
//  MyFudanCampus
//
//  Created by alex on 2017/11/13.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

import UIKit
import Foundation
import Charts

class SecondViewController: UIViewController {

    //@IBOutlet weak var inputText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //准备sql语句
        let mysql = "SELECT  Lesson.lessonName, Lesson.lessonCode, Lesson.creditPoint, Course.totalStudentNumber,Teacher.id AS teacherId, Teacher.name AS teacherName, Semester.name AS semesterName, Score.scoreValue, Score.studentCount FROM (Lesson INNER JOIN Course ON Lesson.id = Course.lesson_id) LEFT JOIN Score ON Course.id = Score.course_id LEFT JOIN Teacher ON Course.teacher_id = Teacher.id LEFT JOIN Semester ON Course.semester_id = Semester.id WHERE Lesson.lessonName like '%C%' ORDER BY Semester.name desc, Lesson.lessonCode asc, Score.scoreValue = 'A' DESC, Score.scoreValue = 'A-' DESC, Score.scoreValue = 'B+' DESC, Score.scoreValue = 'B' DESC, Score.scoreValue = 'B-' DESC, Score.scoreValue = 'C+' DESC, Score.scoreValue = 'C' DESC, Score.scoreValue = 'C-' DESC, Score.scoreValue = 'D+' DESC, Score.scoreValue = 'D' DESC, Score.scoreValue = 'D-' DESC, Score.scoreValue = 'P' DESC, Score.scoreValue = 'F' DESC"
        let dataArray = SQLiteManager.shareInstance.queryDB(sql:mysql)
        var i = 0
        let resultArray = NSMutableArray()
        
        while i<dataArray.count-1
        {
            var scoreArray = [Dictionary<String, Int>]()
            var range = 0
            var test = 0
            test = i
            //print("指针i是'\(test)'")
            
            while ((dataArray[test]as! scoreModel).lessonCode == (dataArray[test+range]as! scoreModel).lessonCode && (test+range)<dataArray.count-1)
            {
                let key = (dataArray[test+range]as! scoreModel).scoreValue
                let value = (dataArray[test+range]as! scoreModel).studentCount
                var dict: [String: Int] = [String: Int]()
                dict[key] = value
                scoreArray.append(dict)
                //print("操作指针是'\(test+range)'")
                range = range+1
            }
            
            //将SQL数组转换成我们想要的数组
            let model:resultModel = resultModel()
            model.lessonName = (dataArray[test]as! scoreModel).lessonName
            model.lessonCode = (dataArray[test]as! scoreModel).lessonCode
            model.creditPoint = (dataArray[test]as! scoreModel).creditPoint
            model.semesterName = (dataArray[test]as! scoreModel).semesterName
            model.teacherName = (dataArray[test]as! scoreModel).teacherName
            model.totalStudentNumber = (dataArray[test]as! scoreModel).totalStudentNumber
            model.scoreArray = scoreArray
            resultArray.add(model)
            i = i+range
            //print("区间range是'\(range)'")
        }
        
        //最后一个score词典少了一个尾部，需要手动补充
        let key = (dataArray[dataArray.count-1]as! scoreModel).scoreValue
        let value = (dataArray[dataArray.count-1]as! scoreModel).studentCount
        var dict: [String: Int] = [String: Int]()
        dict[key] = value
        (resultArray[resultArray.count-1]as! resultModel).scoreArray.append(dict)
        
        //查看输出数组的log
        let x = 0
        let lessonName = (resultArray[x]as! resultModel).lessonName
        let lessonCode = (resultArray[x]as! resultModel).lessonCode
        let creditPoint = (resultArray[x]as! resultModel).creditPoint
        let semesterName = (resultArray[x]as! resultModel).semesterName
        let teacherName = (resultArray[x]as! resultModel).teacherName
        let totalStudentNumber = (resultArray[x]as! resultModel).totalStudentNumber
        var A = "A"
        var scoreNumber = (resultArray[x]as! resultModel).scoreArray
        print("\(lessonName) \(lessonCode) \(creditPoint) \(semesterName) \(teacherName) \(totalStudentNumber) \(scoreNumber)")
        //
    }
    
    
    //@IBAction func btnSearch(_ sender: Any) {
    //}
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

