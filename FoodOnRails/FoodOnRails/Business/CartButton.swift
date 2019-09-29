//
//  CartButton.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/29/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    convenience init(image :UIImage, title :String, target: Any?, action: Selector?) {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.coral, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)

        if let target = target, let action = action {
            button.addTarget(target, action: action, for: .touchUpInside)
        }

        self.init(customView: button)
    }
}

func getCartButton() -> UIBarButtonItem? {
//    if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let dishes = appDelegate.dishesList {
//        let cartBtn: UIBarButtonItem
//        if dishes.isEmpty {
//            cartBtn = UIBarButtonItem(
//                image: UIImage(named: "btnCart.png")?.withRenderingMode(.alwaysOriginal),
//            style: .plain, target: self, action: #selector(handleCartTap))
//            return cartBtn
//        } else {
//            if let image = UIImage(named: "btnCartActive.png") {
//                cartBtn = UIBarButtonItem(
//                image: image.withRenderingMode(.alwaysOriginal),
//                title: " " + String(dishes.count) + " ", target: self, action: #selector(handleCartTap))
//                return cartBtn
//            }
//        }
//    }
    return nil
}
