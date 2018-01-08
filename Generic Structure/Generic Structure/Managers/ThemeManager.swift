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
        
        self.themes = [
            ThemeManager.darkGrayRegular1 : [
                "textColor" : UIColor.mGray1,
                "font" : UIFont.systemFont(ofSize: 20.0)
            ],
        ]
    }
    
    func getAttributesForTheme (_ theme: String) -> [String : Any]? {
        
        if let t = self.themes[theme] {
            return t
        }
        
        return nil
    }
    
    func fontForTheme (_ theme: String) -> UIFont? {
        
        guard let attributes: [String : Any] = self.getAttributesForTheme(theme) else {
            return nil
        }
        
        if let font = attributes["font"] as? UIFont {
            return font
        }
        
        return nil
    }
    
    func colorForTheme (_ theme: String) -> UIColor? {
        
        guard let attributes: [String : Any] = self.getAttributesForTheme(theme) else {
            return nil
        }
        
        if let color = attributes["textColor"] as? UIColor {
            return color
        }
        
        return nil
    }
    
}
