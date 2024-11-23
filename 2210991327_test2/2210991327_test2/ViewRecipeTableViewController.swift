//
//  ViewRecipeTableViewController.swift
//  2210991327_test2
//
//  Created by student-2 on 23/11/24.
//

import UIKit

class ViewRecipeTableViewController: UITableViewController {

    var foodRecipe: Recipe?
  
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var calorielabel: UITextField!
    @IBOutlet weak var preplabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let recipe = foodRecipe {
                    nameLabel.text = recipe.name
                    calorielabel.text = recipe.calorie
                    preplabel.text = recipe.prepration
                    imageView.image = recipe.image
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "unwindDone" else { return }
        let name = nameLabel.text
        let calorie = calorielabel.text
        let preps = preplabel.text
        let image = imageView.image
        
        foodRecipe = Recipe(name: name ?? "", image: image, calorie: calorie, prep: preps)
    }

   

}
