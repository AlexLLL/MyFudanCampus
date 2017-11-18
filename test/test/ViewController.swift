//
//  ViewController.swift
//  test
//
//  Created by alex on 2017/11/19.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //准备sql语句
        let mysql = "SELECT Lesson.lessonName,Lesson.lessonCode, Lesson.creditPoint, Course.totalStudentNumber, Teacher.name AS teacherName, Semester.name AS semesterName, Score.scoreValue, Score.studentCount FROM (Lesson INNER JOIN Course ON Lesson.id = Course.lesson_id) LEFT JOIN Score ON Course.id = Score.course_id LEFT JOIN Teacher ON Course.teacher_id = Teacher.id LEFT JOIN Semester ON Course.semester_id = Semester.id WHERE Lesson.lessonName like '%C%' ORDER BY Semester.name desc"
        let resultArray = SQLiteManager.shareInstance.queryDB(sql:mysql)
        print(resultArray)
 
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

