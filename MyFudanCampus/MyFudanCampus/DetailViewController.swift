//
//  DetailViewController.swift
//  MyFudanCampus
//
//  Created by alex on 2017/11/17.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

import UIKit
import Charts

class DetailViewController: UIViewController {

    //var lineChartEntry = [ChartDataEntry]()
    var cellShow = resultModel()
    
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var creditPoint: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var semesterName: UILabel!
    @IBOutlet weak var lessonCode: UILabel!
    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var totalStudentNumber: UILabel!
    @IBOutlet weak var scoreView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lessonName.text! = cellShow.lessonName
        lessonCode.text! = String(cellShow.lessonCode)
        semesterName.text! = cellShow.semesterName
        teacherName.text! = "教师："+cellShow.teacherName
        creditPoint.text! = "学分："+String(cellShow.creditPoint)
        totalStudentNumber.text! = "总人数："+String(cellShow.totalStudentNumber)
        //
        let scoreVaule = cellShow.scoreVaule
        let scoreCount = cellShow.scoreCount
        var i = 0
        var string = ""
        while i<scoreVaule.count {
            let a = scoreVaule[i]
            let b = String(Int(scoreCount[i]))
            string.append(a+":"+b+"  ")
            i = i+1
        }
        scoreView.text! = string
        
        //pieChart数据及格式设置
        setChart(dataPoints: scoreVaule, values: scoreCount)
        pieChartView.usePercentValuesEnabled = true //是否根据所提供的数据, 将显示数据转换为百分比格式
        pieChartView.dragDecelerationEnabled = true //拖拽饼状图后是否有惯性效果
        pieChartView.drawEntryLabelsEnabled = true //是否显示区块文本
        pieChartView.chartDescription?.text = ""
        
        
    }

    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry1 = PieChartDataEntry(value: values[i], label: dataPoints[i])
            dataEntries.append(dataEntry1)
        }
        

        
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "绩点分布")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        formatter.multiplier = 1.0
        formatter.percentSymbol = "%"
        formatter.zeroSymbol = ""
        pieChartData.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        pieChartView.data = pieChartData
        
        var colors: [UIColor] = []
        
        for _ in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
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
