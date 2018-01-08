//
//  ExampleServiceObject.swift
//  Generic Structure
//
//  Created by Afonso Rosa on 08/01/18.
//  Copyright © 2018 Afonso Rosa. All rights reserved.
//

import UIKit
import Gloss

struct ExampleServiceObject: JSONDecodable, Codable {
    
    let id: Float?
    let name: String?
    
    init?(json: JSON) {
        self.id = "id" <~~ json
        self.name = "name" <~~ json
    }
    
}
