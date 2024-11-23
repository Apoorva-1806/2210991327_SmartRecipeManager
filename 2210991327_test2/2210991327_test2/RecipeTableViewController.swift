//
//  RecipeTableViewController.swift
//  2210991327_test2
//
//  Created by student-2 on 23/11/24.
//

import UIKit

class RecipeTableViewController: UITableViewController {

    var allRecipes = Food.allMeals
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return allRecipes.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRecipes[section].food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let meal = allRecipes[indexPath.section]
        let foodItem = meal.food[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(foodItem.name)"
        content.secondaryText = "\(String(describing: foodItem.description))"
        cell.contentConfiguration = content

        cell.showsReorderControl = true
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return allRecipes[section].name
    }
    

    @IBSegueAction func viewRecipe(_ coder: NSCoder, sender: Any?) -> ViewRecipeTableViewController? {
        if let cell = sender as? UITableViewCell {
            let indexPath = tableView.indexPath(for: cell)
            
            let foodToShow = allRecipes[indexPath!.section]
            let foodItem = foodToShow.food[indexPath!.row]
            return ViewRecipeTableViewController(coder: coder, foodRecipe: foodToShow)
        }
        return ViewRecipeTableViewController(coder: coder)
    }
    
    
    @IBAction func unwindToRecipeTableView(_ unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "unwindSave",
              let sourceVC = unwindSegue.source as? AddRecipeTableViewController,
              let meal = sourceVC.foodRecipe else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            allRecipes[selectedIndexPath.row] = meal
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: allRecipes.count, section: 0)
            allRecipes.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    
    

}
