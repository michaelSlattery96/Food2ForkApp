//
//  RecipeCell.swift
//  Food2ForkApp
//
//  Created by Michael Slattery on 14/05/2019.
//  Copyright © 2019 Michael Slattery. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeCell: UITableViewCell {
    
    @IBOutlet private weak var recipeName: UILabel!
    @IBOutlet private weak var recipeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.separatorInset = .zero
    }
    
    func setUp(recipe: Recipe) {
        
        recipeName.text = recipe.title
        
        recipeImage.sd_setImage(with: URL(string: recipe.imageURL)) { (image, error, _, _) in
            
            self.recipeImage.image = image
        }
    }
    
    static var nib: UINib {
        
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        
        return String(describing: self)
    }
}
