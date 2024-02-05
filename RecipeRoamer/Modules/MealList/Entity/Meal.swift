//
//  Meal.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import Foundation

struct Meal {
    var id: String
    var name: String
    var tags: String
    var imageUrl: URL?
    var ingredients: [String]
    var instruction: String
    
    init(from response: MealResponse) {
        self.id = response.idMeal ?? ""
        self.name = response.strMeal ?? ""
//        self.tags = response.strTags ?? ""
        self.imageUrl = URL(string: response.strMealThumb ?? "")
        self.instruction = response.strInstructions ?? ""
        
        self.tags = response.strTags?.components(separatedBy: ",").prefix(2).joined(separator: ",") ?? ""
        
        self.ingredients = [
                    "\(response.strMeasure1 ?? "") \(response.strIngredient1 ?? "")",
                    "\(response.strMeasure2 ?? "") \(response.strIngredient2 ?? "")",
                    "\(response.strMeasure3 ?? "") \(response.strIngredient3 ?? "")",
                    "\(response.strMeasure4 ?? "") \(response.strIngredient4 ?? "")",
                    "\(response.strMeasure5 ?? "") \(response.strIngredient5 ?? "")",
                    "\(response.strMeasure6 ?? "") \(response.strIngredient6 ?? "")",
                    "\(response.strMeasure7 ?? "") \(response.strIngredient7 ?? "")",
                    "\(response.strMeasure8 ?? "") \(response.strIngredient8 ?? "")",
                    "\(response.strMeasure9 ?? "") \(response.strIngredient9 ?? "")",
                    "\(response.strMeasure10 ?? "") \(response.strIngredient10 ?? "")",
                    "\(response.strMeasure11 ?? "") \(response.strIngredient11 ?? "")",
                    "\(response.strMeasure12 ?? "") \(response.strIngredient12 ?? "")",
                    "\(response.strMeasure13 ?? "") \(response.strIngredient13 ?? "")",
                    "\(response.strMeasure14 ?? "") \(response.strIngredient14 ?? "")",
                    "\(response.strMeasure15 ?? "") \(response.strIngredient15 ?? "")",
                    "\(response.strMeasure16 ?? "") \(response.strIngredient16 ?? "")",
                    "\(response.strMeasure17 ?? "") \(response.strIngredient17 ?? "")",
                    "\(response.strMeasure18 ?? "") \(response.strIngredient18 ?? "")",
                    "\(response.strMeasure19 ?? "") \(response.strIngredient19 ?? "")",
                    "\(response.strMeasure20 ?? "") \(response.strIngredient20 ?? "")"
        ].filter { !$0.isEmpty && $0.trimmingCharacters(in: .whitespacesAndNewlines) != "" }
    }
    
}
