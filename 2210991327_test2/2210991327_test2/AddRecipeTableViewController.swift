//
//  AddRecipeTableViewController.swift
//  2210991327_test2
//
//  Created by student-2 on 23/11/24.
//

import UIKit

class AddRecipeTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var foodRecipe: Food?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var ingredientsLabel: UITextField!
    @IBOutlet weak var prepLabel: UITextField!
    @IBOutlet weak var categoryLabel: UITextField!
    @IBOutlet weak var nutriotionallabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let foodRecipe {
            imageView.image = foodRecipe.food[0].image
            nameLabel.text = foodRecipe.food[0].name
            ingredientsLabel.text = foodRecipe.food[0].ingredients
            prepLabel.text = foodRecipe.food[0].prepration
            categoryLabel.text = foodRecipe.food[0].category
            nutriotionallabel.text = foodRecipe.food[0].nutition
            title = "Edit Recipe"
        } else {
            title = "Add recipe"
        }
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let alertController = UIAlertController(title:"Choose Image From gallery", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in print("user has choosen photo library")
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photLibraryAction)
        }
        
        present(alertController, animated:true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "unwindSave" else { return }
        
        let image = imageView.image
        let name = nameLabel.text
        let ingredients = ingredientsLabel.text
        let prep = prepLabel.text
        let categroy = categoryLabel.text
        let nutition = nutriotionallabel.text
        
        foodRecipe = Food(name: name ?? "", food: [Recipe(name: name!, image: image!, ingredients: ingredients!, prepration: prep, category: categroy!, nutition: nutition!)])
    }
   

}
