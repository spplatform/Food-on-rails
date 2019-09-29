//
//  Notifications.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/29/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import Foundation
import UIKit

extension Notification.Name {
     static let updateCart = Notification.Name("updateCart")
}

extension UIColor {
    public convenience init(rgba: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        if rgba.hasPrefix("#") {
            let index   = rgba.index(rgba.startIndex, offsetBy: 1)
            let hex     = String(rgba[index...])
            let scanner = Scanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            if scanner.scanHexInt64(&hexValue) {
                switch (hex.count) {
                case 3:
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
                case 4:
                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    alpha = CGFloat(hexValue & 0x000F)             / 15.0
                case 6:
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                case 8:
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                default:
                    print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
                }
            } else {
                //swlog("Scan hex error")
            }
        } else {
            print("Invalid RGB string, missing '#' as prefix", terminator: "")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    public class func fromComponents(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: alpha)
    }
    
    
    static var random: UIColor {
        let getComponent = { Int(arc4random_uniform(190) + 25) }
        return .fromComponents(red: getComponent(), green: getComponent(), blue: getComponent())
    }
    
    func colorByDarkeningColor(value: CGFloat) -> UIColor {
        let totalComponents = self.cgColor.numberOfComponents;
        let isGreyscale = (totalComponents == 2) ? true : false;
        
        let oldComponents = self.cgColor.components;
        var newComponents = [CGFloat]()
        
        if (isGreyscale) {
            newComponents.append(oldComponents![0] - value < 0.0 ? 0.0 : oldComponents![0] - value)
            newComponents.append(oldComponents![0] - value < 0.0 ? 0.0 : oldComponents![0] - value)
            newComponents.append(oldComponents![0] - value < 0.0 ? 0.0 : oldComponents![0] - value)
            newComponents.append(oldComponents![1])
        }
        else {
            newComponents.append(oldComponents![0] - value < 0.0 ? 0.0 : oldComponents![0] - value)
            newComponents.append(oldComponents![1] - value < 0.0 ? 0.0 : oldComponents![1] - value)
            newComponents.append(oldComponents![2] - value < 0.0 ? 0.0 : oldComponents![2] - value)
            newComponents.append(oldComponents![3])
        }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB();
        let newColor = CGColor(colorSpace: colorSpace, components: newComponents);
        
        let retColor = UIColor(cgColor: newColor!)
        
        return retColor;
    }
}

extension UIColor {
    /// Color for badge, alert and tutorial EE3124
    static let coral = #colorLiteral(red: 0.9333333333, green: 0.1921568627, blue: 0.1411764706, alpha: 1)

    /// Color for tint button navigation Bar #333333
    static let barTintColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)

    /// #333333
    static let barBackground = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)

    /// Color for navigation bar and other background. #F8F8F8
    static let navBarBackground = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
}
