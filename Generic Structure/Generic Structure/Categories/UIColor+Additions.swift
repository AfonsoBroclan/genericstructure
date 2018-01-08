//
//  UIColor+Additions.swift
//  Generic Structure
//
//  Created by Afonso Rosa on 08/01/18.
//  Copyright © 2018 Afonso Rosa. All rights reserved.
//

import UIKit

//extension for custom colors
extension UIColor {
    
    static let mGray1 = UIColor.init(red: 178, green: 178, blue: 178)
}

//extension for HEX
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        
        let nRed = red >= 0 && red <= 255 ? red : (red < 0 ? 0 : 255)
        let nGreen = green >= 0 && green <= 255 ? green : (green < 0 ? 0 : 255)
        let nBlue = blue >= 0 && blue <= 255 ? blue : (blue < 0 ? 0 : 255)
        
        self.init(red: CGFloat(nRed) / 255.0, green: CGFloat(nGreen) / 255.0, blue: CGFloat(nBlue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex:Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
}
