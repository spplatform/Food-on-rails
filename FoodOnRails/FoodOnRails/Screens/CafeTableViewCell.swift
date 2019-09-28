//
//  CafeTableViewCell.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/29/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import UIKit

class CafeTableViewCell: UITableViewCell {

    @IBOutlet var logo: UIImageView!
    @IBOutlet var cafeName: UILabel!
    @IBOutlet var minOrder: UILabel!
    @IBOutlet var kitchenType: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
