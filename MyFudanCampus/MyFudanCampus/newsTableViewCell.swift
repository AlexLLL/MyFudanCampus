//
//  newsTableViewCell.swift
//  MyFudanCampus
//
//  Created by alex on 2017/11/26.
//  Copyright © 2017年 AlexLLL. All rights reserved.
//

import UIKit

class newsTableViewCell: UITableViewCell {

    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
