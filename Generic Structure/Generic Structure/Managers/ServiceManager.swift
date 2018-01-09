//
//  ServiceManager.swift
//  Generic Structure
//
//  Created by Afonso Rosa on 07/01/18.
//  Copyright © 2018 Afonso Rosa. All rights reserved.
//

import Foundation
import Alamofire
import Gloss

//singleton to handle all the service requests
class ServiceManager {
    
    //baseURL to be used for the services, should be the api base endpoint
    private let baseURL = ""
    
    static let sharedInstance = ServiceManager()
    private init() {} //This prevents others from using the default '()' initializer for this class.
    
    //function to process a generic get request
    private func getRequestWithUrl(_ url : String, success: @escaping ((_ data: JSON) -> Void), error: @escaping ((_ errorMessage: String) -> Void)) {
        
        Alamofire.request(self.baseURL + url).responseJSON { response in
            
            guard response.result.isSuccess else {
                if let errorMessage = response.result.error {
                    print("Error: \(errorMessage)")
                    error("Error: \(errorMessage)")
                }
                return
            }
            
            guard let responseJSON = response.result.value as? JSON else {
                print("Invalid response. JSON required")
                error("Invalid response. JSON required")
                return
            }
            
            success(responseJSON)
        }
    }

}
