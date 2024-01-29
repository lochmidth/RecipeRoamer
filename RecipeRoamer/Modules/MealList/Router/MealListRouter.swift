//
//  MealListRouter.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import UIKit

class MealListRouter {
    
    var navigationController: UINavigationController!
    
    let mealRecipeBuilder: MealRecipeBuilder
    
    init(mealRecipeBuilder: MealRecipeBuilder = MealRecipeBuilder()) {
        self.mealRecipeBuilder = mealRecipeBuilder
    }
}

extension MealListRouter: MealListRouterInput {
    func showRecipe(with meal: MealProtocol) {
        print("DEBUG: Handle show recipe here")
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        Task { @MainActor in
            navigationController.present(alert, animated: true)
        }
    }
    
    
}
