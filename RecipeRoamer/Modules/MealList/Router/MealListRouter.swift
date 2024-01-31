//
//  MealListRouter.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import UIKit

final class MealListRouter {
    
    var navigationController: UINavigationController!
    
    private let mealRecipeBuilder: MealRecipeBuilder
    
    init(mealRecipeBuilder: MealRecipeBuilder = MealRecipeBuilder()) {
        self.mealRecipeBuilder = mealRecipeBuilder
    }
}

extension MealListRouter: MealListRouterInput {
    func showRecipe(with meal: Meal) {
        let mealRecipe = mealRecipeBuilder.build(with: meal)
        navigationController.pushViewController(mealRecipe, animated: true)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: Constants.ok, style: .default))
        Task { @MainActor in
            navigationController.present(alert, animated: true)
        }
    }
}

extension MealListRouter {
    struct Constants {
        static let ok = "OK"
    }
}
