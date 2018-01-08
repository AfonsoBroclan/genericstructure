//
//  ThemeManager.swift
//  Generic Structure
//
//  Created by Afonso Rosa on 08/01/18.
//  Copyright © 2018 Afonso Rosa. All rights reserved.
//

import Foundation
import UIKit

class ThemeManager {
    
    static let darkGrayRegular1 = "darkGrayRegular1"
    
    private var themes : [String: [String : Any]]
    
    static let sharedInstance = ThemeManager()
    
    private init() { //This prevents others from using the default '()' initializer for this class.
        if self = super.init {
            self.themes = [
                ThemeManager.darkGrayRegular1 : [
                    "textColor" : UIColor.gray,
                    "font" : UIFont.systemFont(ofSize: 20.0)
                ],
            ]
        }
        return self
    }
    
    func getAttributesForTheme (_ theme: String) -> [String : Any] {
        guard let theme = theme else {
            return nil
        }
        
        return self.themes[theme]
    }
    
    func fontForTheme (_ theme: String) -> UIFont {
        guard let theme = theme else {
            return nil
        }
        
        let attributes: [String : Any] = self.getAttributesForTheme(theme)
        
        if let font = attributes["font"] {
            return font
        }
        
        return nil
    }
    
    func colorForTheme (_ theme: String) -> UIFont {
        guard let theme = theme else {
            return nil
        }
        
        let attributes: [String : Any] = self.getAttributesForTheme(theme)
        
        if let color = attributes["textColor"] {
            return color
        }
        
        return nil
    }
    
}
