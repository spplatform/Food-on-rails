//
//  CafeTableViewCell.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/29/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import UIKit

class CafeTableViewCell: UITableViewCell {

    @IBOutlet var container: DesignableView!
    @IBOutlet var logo: UIImageView!
    @IBOutlet var cafeName: UILabel!
    @IBOutlet var minOrder: UILabel!
    @IBOutlet var kitchenType: UILabel!
    
    @IBOutlet var markContainer: UIView!
    @IBOutlet var mark: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        logo.roundCorners(corners: [.topLeft, .topRight], radius: 5.0)
        markContainer.roundCorners(corners: [.topLeft, .bottomRight], radius: 5.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
