//
//  SQLiteManager.swift
//  MyFudanCampus
//
//  Created by alex on 2017/11/18.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

import Foundation
class SQLiteManager: NSObject {
    // 0. 将类设计成单例
    static let shareInstance : SQLiteManager = SQLiteManager()
    
    // 1. 保存数据库队列对象
    var dbQueue : FMDatabaseQueue?
    
    // 2. 打开数据库
    func openDB () {
        //2.1 设置数据库的路径;
        let dbPath = Bundle.main.path(forResource:"data", ofType: "s3db")
        
        //2.2 创建数据库
        dbQueue = FMDatabaseQueue(path: dbPath)
        
    }
    
    
    // 3. 查询数据库,并将数据以数组的形式返回:
    func queryDB(sql: String) -> [[String: AnyObject]] {
        
        openDB ();
        // 3.1 创建可变数组
        var array: [[String: AnyObject]] = [[String: AnyObject]]()
        
        // 3.2 执行sql
        SQLiteManager.shareInstance.dbQueue?.inDatabase { (db) in
            
            let dbResult: FMResultSet! = db.executeQuery(sql, withArgumentsIn: [])
            
            // 创建一个可变字典
            var dict: [String: AnyObject] = [String: AnyObject]()
            
            // 遍历结果
            while dbResult.next() {
                //取列数
                let column = dbResult.columnCount()
                // for in 循环
                for i in 0..<column {
                    
                    // 根据列的索引取出键:类似于key
                    let key = dbResult.columnName(for: i)
                    // 根据列的索引取出值:类似于value
                    let value = dbResult.object(forColumnIndex: i)
                    
                    // 赋值
                    dict[key] = value
                    
                }
                // 添加到可变数组
                array.append(dict)
                //print("\(key)---\(value)")
            }
            
        }
        
        return array
    }
}

