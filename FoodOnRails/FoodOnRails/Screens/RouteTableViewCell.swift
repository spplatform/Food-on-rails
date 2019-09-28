//
//  RouteTableViewCell.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/28/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import UIKit

class RouteTableViewCell: UITableViewCell {

    @IBOutlet var stationName: UILabel!
    @IBOutlet var arriveTime: UILabel!
    @IBOutlet var timer: UILabel!
    @IBOutlet var timerValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
