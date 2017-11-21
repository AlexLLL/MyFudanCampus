//
//  SQLiteManager.swift
//  test
//
//  Created by alex on 2017/11/19.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

import Foundation
import UIKit
class SQLiteManager: NSObject {
    // 0. 将类设计成单例
    static let shareInstance : SQLiteManager = SQLiteManager()
    override init()  {
        super.init()
    }
    // 1. 保存数据库队列对象
    var dbQueue : FMDatabaseQueue?
    // 2. 打开数据库
    func openDB () {
        //2.1 设置数据库的路径;
        let dbPath = Bundle.main.path(forResource:"data", ofType: "s3db")
        
        //2.2 创建数据库
        dbQueue = FMDatabaseQueue(path: dbPath)
        // 3.创建表
        //createTable()
    }
    

    // 3. 查询数据库,并将数据以数组的形式返回:
    func queryDB(sql: String) -> NSMutableArray {
        
        openDB ();
        // 3.1 创建可变数组
        let resultArray = NSMutableArray()
        
        // 3.2 执行sql
        SQLiteManager.shareInstance.dbQueue?.inDatabase { (db) in
            let dbResult: FMResultSet! = db.executeQuery(sql, withArgumentsIn:[])
            
            // 遍历结果
            if (dbResult != nil)
            {
                while dbResult.next() {
                    let model:scoreModel = scoreModel()
                    model.lessonName = String(dbResult.string(forColumn: "lessonName")!)
                    model.lessonCode = String(dbResult.string(forColumn: "lessonCode")!)
                    model.creditPoint = Double(dbResult.double(forColumn: "creditPoint"))
                    model.semesterName = String(dbResult.string(forColumn: "semesterName")!)
                    model.teacherName = String(dbResult.string(forColumn: "teacherName")!)
                    model.totalStudentNumber = Int(dbResult.int(forColumn: "totalStudentNumber"))
                    model.scoreValue = String(dbResult.string(forColumn: "scoreValue")!)
                    model.studentCount = Int(dbResult.int(forColumn: "studentCount"))
                    //print(model.lessonName)
                    resultArray.add(model)
                    }
            }
        }
        return resultArray
    }
}
