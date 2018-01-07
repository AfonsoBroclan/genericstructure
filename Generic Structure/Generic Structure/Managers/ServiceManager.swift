//
//  ServiceManager.swift
//  Generic Structure
//
//  Created by Afonso Rosa on 07/01/18.
//  Copyright © 2018 Afonso Rosa. All rights reserved.
//

import Foundation

class ServiceManager {
    
    static let sharedInstance = ServiceManager()
    private init() {} //This prevents others from using the default '()' initializer for this class.

}
