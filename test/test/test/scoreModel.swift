//
//  scoreModel.swift
//  test
//
//  Created by alex on 2017/11/19.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

import Foundation
import UIKit
class scoreModel: NSObject {
    var lessonName:String = String()
    var lessonCode:String = String()
    var creditPoint:Double = Double()
    var totalStudentNumber:Int = Int()
    var teacherName:String = String()
    var semesterName:String = String()
    var scoreValue:String = String()
    var studentCount:Int = Int()
}

class resultModel: NSObject {
    var lessonName:String = String()
    var lessonCode:String = String()
    var creditPoint:Double = Double()
    var totalStudentNumber:Int = Int()
    var teacherName:String = String()
    var semesterName:String = String()
    var scoreArray: [Dictionary<String, Int>] = [Dictionary<String, Int>]()
}

