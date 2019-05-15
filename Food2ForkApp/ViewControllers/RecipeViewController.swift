//
//  RecipeViewController.swift
//  Food2ForkApp
//
//  Created by Michael Slattery on 14/05/2019.
//  Copyright © 2019 Michael Slattery. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet private var recipeTableView: UITableView!
    
    @IBAction func sortButtonTapped(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: nil, message: .actionSheetMessage, preferredStyle: .actionSheet)
        
        let sortAction = UIAlertAction(title: .sortActionTitle, style: .default, handler: { _ in
            
            self.sortAlphabetically()
        })
        let cancelAction = UIAlertAction(title: .cancelActionTitle, style: .cancel)
        
        actionSheet.addAction(sortAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    var recipes: [Recipe]?
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        
        recipeTableView.register(RecipeCell.nib, forCellReuseIdentifier: RecipeCell.identifier)
        
        getRecipes()
    }
    
    private func getRecipes() {
        
        API.getRecipes { (recipes, count) in
            
            guard let recipes = recipes, let count = count else { return }
            
            self.count = count
            
            for recipe in recipes {
                
                guard let title = recipe["title"] as? String,
                    let imageUrl = recipe["image_url"] as? String else { return }
                
                if self.recipes?.append(Recipe(title: title, imageUrl: imageUrl)) == nil {
                    
                    self.recipes = [Recipe(title: title, imageUrl: imageUrl)]
                }
            }
            
            DispatchQueue.main.async {
                
                self.recipeTableView.reloadData()
            }
        }
    }
    
    private func sortAlphabetically() {
        
        guard let unsortedRecipes = recipes else { return }
        
        recipes = unsortedRecipes.sorted { $1.title > $0.title }
        
        DispatchQueue.main.async {
            
            self.recipeTableView.reloadData()
        }
    }
}

extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let recipes = recipes else { return UITableViewCell() }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as? RecipeCell {
        
            cell.setUp(recipe: recipes[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
