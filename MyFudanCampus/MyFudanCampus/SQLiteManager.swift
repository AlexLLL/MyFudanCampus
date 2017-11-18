//
//  SQLiteManager.swift
//  MyFudanCampus
//
//  Created by alex on 2017/11/18.
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
        createTable()
    }
    
    /**
     创建表
     */
    func createTable()  {
        // 1.编写SQL语句
        let sql = "CREATE TABLE IF NOT EXISTS T_Person( " +
            "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
            "name TEXT," +
            "age INTEGER " +
        ");"
        
        // 2.执行SQL语句
        dbQueue?.inDatabase({ (db) -> Void in
            db.executeUpdate(sql, withArgumentsIn:[])
        })
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
            while dbResult.next() {
                let model:scoreModel = scoreModel()
                model.lessonName = String(describing: dbResult.string(forColumn: "lessonName"))
                model.lessonCode = String(describing: dbResult.string(forColumn: "lessonCode"))
                model.creditPoint = Double(dbResult.double(forColumn: "creditPoint"))
                model.semesterName = String(describing: dbResult.string(forColumn: "semesterName"))
                model.teacherName = String(describing: dbResult.string(forColumn: "teacherName"))
                model.totalStudentNumber = Int(dbResult.int(forColumn: "totalStudentNumber"))
                model.scoreValue = String(describing: dbResult.string(forColumn: "scoreValue"))
                model.studentCount = Int(dbResult.int(forColumn: "studentCount"))
                // 添加到可变数组
                resultArray.add(model)
            }
        }
        return resultArray
    }
}

