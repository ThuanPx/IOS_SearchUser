//
//  ColorManager.swift
//  KidsBook
//
//  Created by Dang Nguyen Vu on 9/4/18.
//  Copyright © 2018 XStudio. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgba(_ red: Int?, green: Int?, blue: Int?, alpha: CGFloat = 1.0) -> UIColor {
        
        guard let r = red, let g = green, let b = blue else {
            return .white
        }
        
        let denominator: CGFloat = 255.0
        let color = UIColor(red: CGFloat(r) / denominator, green: CGFloat(g) / denominator, blue: CGFloat(b) / denominator, alpha: alpha)
        return color
    }
    
    static func hex(_ hexStr: String, alpha: CGFloat = 1) -> UIColor {
        let scanner = Scanner(string: hexStr.replacingOccurrences(of: "#", with: ""))
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red: r, green: g, blue: b, alpha: alpha)
        } else {
            return .white
        }
    }
    
    static var grayText: UIColor {
        return hex("B3B3B3")
    }
    
    static var gray80: UIColor {
        return hex("808080")
    }
    
    static var blackText: UIColor {
        return hex("1A1A1A")
    }
    
    static var yellow: UIColor {
        return hex("FFF23F")
    }
    
    static var lightYellow: UIColor {
        return hex("FFF67F")
    }
    
    static var yellow500: UIColor {
        return hex("FFE500")
    }
    
    static var yellowBcb: UIColor {
        return hex("FFFBCB")
    }
    
    static var background: UIColor {
        return hex("F5F5F5")
    }
    
    static var navigationBar: UIColor {
        return hex("EBEBEB")
    }
    
    static var red: UIColor {
        return hex("F05A63")
    }
}
