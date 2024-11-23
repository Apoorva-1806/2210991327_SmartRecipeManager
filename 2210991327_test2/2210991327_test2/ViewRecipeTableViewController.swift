//
//  ViewRecipeTableViewController.swift
//  2210991327_test2
//
//  Created by student-2 on 23/11/24.
//

import UIKit

class ViewRecipeTableViewController: UITableViewController {

    var foodRecipe: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    init? (coder: NSCoder, foodRecipe: Food?) {
        self.foodRecipe = foodRecipe
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

   

}
