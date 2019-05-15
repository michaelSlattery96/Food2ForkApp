//
//  Recipe.swift
//  Food2ForkApp
//
//  Created by Michael Slattery on 14/05/2019.
//  Copyright © 2019 Michael Slattery. All rights reserved.
//

import Foundation

struct Recipe {
    
    var title: String
    var imageURL: String
    
    init(title: String, imageUrl: String) {
        
        self.title = title
        self.imageURL = imageUrl
    }
}
