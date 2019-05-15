//
//  API.swift
//  Food2ForkApp
//
//  Created by Michael Slattery on 14/05/2019.
//  Copyright © 2019 Michael Slattery. All rights reserved.
//

import Foundation
import Alamofire

class API {
    
    static let baseUrl = "https://www.food2fork.com/api/search?key="
    static let token = "36b1724423262a3438917444ce0414f9"
    
    static func getRecipes(completion: @escaping ([[String: Any]]?, Int?) -> Void) {
        
        DispatchQueue.global(qos: .utility).async {
            
            Alamofire.request("\(baseUrl)\(token)").responseJSON { response in
                
                if let json = response.result.value as? [String: Any],
                    let recipes = json["recipes"] as? [[String: Any]],
                    let count = json["count"] as? Int?{
                    
                    completion(recipes, count)
                } else {
                    
                    completion(nil, nil)
                }
            }
        }
    }
}
