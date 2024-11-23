//
//  Recipe.swift
//  2210991327_test2
//
//  Created by student-2 on 23/11/24.
//

import Foundation
import UIKit


struct Recipe{
    var name: String
    var description: String?
    var image: UIImage?
    var ingredients : String?
    var prepration: String?
    var category: String?
    var nutition: String?
}

struct Food{
    var name: String
    var food : [Recipe]
    
    static let allMeals: [Food] = [
        Food(name: "Breakfast", food: [Recipe(name: "Poha", description: "Light flaky food", image: UIImage(named: "cake"), ingredients: "Poha", prepration: "kjsgr,fjjsd,gv", category: "vegan", nutition: "healthy"),
                                       Recipe(name: "Aloo Parantha", description: "Stuffed with aloo"),
                                       Recipe(name: "dalia", description: "Healthy milet")]),
        
        Food(name: "Lunch", food: [Recipe(name: "Rajma chawal", description: "Fav of everyone.. OBv"),
                                   Recipe(name: "Curry", description: "Made with lassi"),
                                   Recipe(name: "Aloo sabzi", description: "Aloo with puri")]),
        
        Food(name: "Snacks", food: [Recipe(name: "Coffee", description: "Just a coffee"),
                                    Recipe(name: "SAndwich", description: "Light veggie sandwich"),
                                    Recipe(name: "Cookies", description: "Sweet baked item")]),
        
        Food(name: "Dinner", food: [Recipe(name: "dal Makhni", description: "With naan"),
                                    Recipe(name: "Saag", description: "With makki ki roti"),
                                    Recipe(name: "Kofta", description: "Soft sweet balls")])
    ]
}

    
