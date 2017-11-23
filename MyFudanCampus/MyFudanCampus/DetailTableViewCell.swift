//
//  DetailTableViewCell.swift
//  MyFudanCampus
//
//  Created by alex on 2017/11/17.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var semesterName: UILabel!
    @IBOutlet weak var creditPoint: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
