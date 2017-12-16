//
//  busTableViewCell.swift
//  MyFudanCampus
//
//  Created by alex on 2017/12/16.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

import UIKit

class busTableViewCell: UITableViewCell {

    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var time2: UILabel!
    @IBOutlet weak var time1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
