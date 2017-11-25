//
//  scoreTableViewCell.swift
//  MyFudanCampus
//
//  Created by alex on 2017/11/25.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

import UIKit

class scoreTableViewCell: UITableViewCell {

    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    
    @IBOutlet weak var lessonCode: UILabel!
    @IBOutlet weak var semesterName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
