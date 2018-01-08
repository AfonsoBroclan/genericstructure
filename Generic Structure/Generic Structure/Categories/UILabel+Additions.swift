//
//  UILabel+Additions.swift
//  Generic Structure
//
//  Created by Afonso Rosa on 08/01/18.
//  Copyright © 2018 Afonso Rosa. All rights reserved.
//

import UIKit

extension UILabel {
    @IBInspectable
    var theme : String{
        get {
            return self.theme
        }
        set {
            guard let font = ThemeManager.sharedInstance.fontForTheme(newValue) else {
                return
            }
            
            guard let color = ThemeManager.sharedInstance.colorForTheme(newValue) else {
                return
            }
            self.font = font
            self.textColor = color
        }
    }
}
