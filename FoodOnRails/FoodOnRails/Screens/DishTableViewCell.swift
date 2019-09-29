//
//  DishTableViewCell.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/29/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import UIKit

class DishTableViewCell: UITableViewCell {

    @IBOutlet var logo: UIImageView!
    @IBOutlet var dishName: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var dishText: UILabel!
    @IBOutlet var priceContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        logo.layer.masksToBounds = true
        logo.layer.cornerRadius = 5
        
        priceContainer.layer.masksToBounds = true
        priceContainer.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
